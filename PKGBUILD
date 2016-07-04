# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.4.4
pkgrel=1
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python2' 'ansible' 'python2-netaddr' 'python2-ldap' 'python2-passlib' 'util-linux' 'encfs' 'gnupg')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('e62993cafd84fff6ea59e970da87c3e17b9b0d3da22c976b2d9f29a7194f1761')

build() {
	cd "$pkgname-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
