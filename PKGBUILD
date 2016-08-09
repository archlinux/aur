# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.4.4
pkgrel=2
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python2' 'ansible' 'python2-netaddr' 'python2-ldap' 'python2-passlib' 'util-linux' 'encfs' 'gnupg')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('cfc85ebb4249b851d18df2283a781f009460c386bbcc1093da80443a21a1f556')

build() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
