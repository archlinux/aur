# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=python2-qtawesome
_pkgname='qtawesome'
pkgver=0.6.0
pkgrel=2
pkgdesc='Iconic fonts in PyQt and PySide applications'
arch=('any')
url="https://github.com/spyder-ide/${_pkgname}/"
license=('MIT')
source=("python-${_pkgname}-${pkgver}.tar.gz"::"https://github.com/spyder-ide/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('573192ceb76f79f384e8cfb2d5e69ad63ae97cb89711d5e1d2a9373eb6cc2067')
makedepends=('python2' 'python2-setuptools')
depends=('python2-six' 'python2-qtpy')

build() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"
  python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  # Install license file
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

