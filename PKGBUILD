# Maintainer: Amish <contact at via dot aur>
pkgname=python-pyzor
_pkgname=${pkgname#python-}
pkgver=1.0.1b
pkgrel=2
_gitrev=2be00c3
pkgdesc='Spam-blocking networked system that uses spam signatures to identify spam'
arch=('any')
url='https://github.com/SpamExperts/pyzor'
license=('GPL')
provides=('pyzor')
conflicts=('pyzor')
replaces=('pyzor')
makedepends=('python-setuptools')
depends=('python')
source=("${_pkgname}-${pkgver}-${_gitrev}.tar.gz::https://github.com/SpamExperts/${_pkgname}/archive/${_gitrev}.tar.gz")
sha256sums=('dd72c7cb496f5e31abe5ffd24d166902afb866d92589850a5da1f0139ba9971e')

build() {
  cd "${srcdir}/${_pkgname}-${_gitrev}"*
  python setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${_gitrev}"*
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
