# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.5.0
pkgrel=1
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python2' 'ansible' 'python2-netaddr' 'python2-ldap' 'python2-passlib' 'util-linux' 'encfs' 'gnupg')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/debops-tools/archive/v$pkgver.tar.gz")
sha256sums=('ab84d9e0851a5cc35eadbe48a16f26a5c8812d84f13fa622664fe376e1a23f64')

build() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
