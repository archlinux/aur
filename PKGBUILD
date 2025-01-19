# Maintainer: Amish <contact at via dot aur>
# Contributor: John Lane <archlinux at jelmail dot com>
# Contributor: Rich Li <rich@dranek.com>
pkgname=pyzor
pkgver=1.1.3b
pkgrel=1
_gitrev=0c44c6f
pkgdesc='Spam-blocking networked system that uses spam signatures to identify spam'
arch=('any')
url='https://github.com/SpamExperts/pyzor'
license=('GPL')
makedepends=('python-setuptools')
depends=('python')
source=("${pkgname}-${pkgver}-${_gitrev}.tar.gz::https://github.com/SpamExperts/${pkgname}/archive/${_gitrev}.tar.gz")
sha256sums=('3ccaa0827684e83ea708bab096dee2e76fa291ac954ea4275535025ac13a8d8c')

build() {
  cd "${srcdir}/${pkgname}-${_gitrev}"*
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${_gitrev}"*
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
