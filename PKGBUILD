# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.6.0
pkgrel=1
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python2' 'ansible' 'python2-netaddr' 'python2-ldap' 'python2-passlib' 'util-linux' 'encfs' 'gnupg')
makedepends=('python2-setuptools')
conflicts=('depops-git')
source=("https://github.com/$pkgname/debops-tools/archive/v$pkgver.tar.gz")
sha256sums=('285466d55b50cc628aaa7851e4b8a115307ffed709ce075236964b6db6c78a8f')

build() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py build
}

package() {
	cd "$pkgname-tools-$pkgver"
	python2 setup.py install --root="$pkgdir" --optimize=1
}
