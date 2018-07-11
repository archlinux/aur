# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.7.2
pkgrel=1
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python' 'ansible' 'python-netaddr' 'python-ldap' 'python-passlib' 'util-linux' 'encfs' 'gnupg' 'python-dnspython')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('862e04cfeb6bdd6a30aea1cb063548784b14e1bd2750a8a61c4c1744ccab1b96')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
