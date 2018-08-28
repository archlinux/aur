# Maintainer: itsme <mymail@ishere.ru>


pkgname=debops
pkgver=0.8.0
pkgrel=1
pkgdesc="A collection of Ansible playbooks, scalable from one container to an entire data center."
arch=('any')
url="http://debops.org/"
license=('GPL3')
depends=('python' 'ansible' 'python-netaddr' 'python-ldap' 'python-passlib' 'util-linux' 'encfs' 'gnupg' 'python-dnspython')
makedepends=('python-setuptools')
conflicts=('depops-git')
source=("https://github.com/${pkgname}/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('0068745fdf79f57a3d1436b88b5849421b1f48c9c5c64da450e51ce9022b0c70')

build() {
	cd "${pkgname}-${pkgver}"
	python setup.py build
}

package() {
	cd "${pkgname}-${pkgver}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
