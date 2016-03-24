# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.4.3
pkgrel=3
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python2' 'ansible' 'python2-netaddr' 'python2-ldap' 'python2-passlib' 'util-linux' 'encfs' 'gnupg')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b8038ffdb845ff4712f3339de21887cc5427e674bc6cd77a174a2c14b27525d9')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
