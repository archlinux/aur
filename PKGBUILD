# Maintainer: Maurice Frank <maurice.frank@posteo.de>

pkgbase=python-stempeg
pkgname="python-stempeg"
_pkgname=stempeg
pkgver=0.1.8
pkgrel=1
pkgdesc="A python package to read and write STEM files."
arch=("x86_64")
url="https://github.com/faroit/stempeg"
license=("MIT")
makedepends=("python-setuptools")
depends=("python-numpy" "python-soundfile")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/faroit/${_pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=("93fff64cd22315e1d181b9f4a57a58b4b4f7363dbd5b4dc9667d77fa83a214af52f5ddf8e099256740be7fcad98b881456ea7f6d1a989cc70522ec89041e3f83")

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

package_python-stempeg() {
  depends=("python-numpy" "python-soundfile")

  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
