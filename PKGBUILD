# Maintainer: Maurice Frank <maurice.frank@posteo.de>

pkgname="python-stempeg"
_pkgname=stempeg
pkgver=0.2.3
pkgrel=1
pkgdesc="A python package to read and write STEM files."
arch=("x86_64")
url="https://github.com/faroit/stempeg"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-numpy1" "python-soundfile")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/faroit/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("402c0823bd73a82b1f473d216e7767446f5ee343c64c5c41018088012978ba7f117961c78af84013470de61a4c5ec1993d8cccd0521bfcf75ec90d3f42f455ae")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package() {
  depends=("python-numpy1" "python-soundfile")

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
