# Maintainer: Martin Joergensen <newsboost at gmail com>
pkgname=python-stego-lsb
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver="1.3.4"
pkgrel=2
pkgdesc="Least Significant Bit Steganography for .bmp, .png, WAV sound files, and byte sequences."
arch=('any')
url="https://github.com/ragibson/Steganography"
license=('MIT')
depends=(python python-click python-pillow python-numpy)
makedepends=(python-setuptools)
provides=('stegolsb')
source=(
  "https://files.pythonhosted.org/packages/43/a7/143a113585c819c457baf627994171f6e9c544c4f188c46170dd3825837b/${_name}-${pkgver}-py2.py3-none-any.whl"
)
md5sums=('d2f23896f41dfb16e925ecafb94ed6d3')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps --no-warn-script-location *.whl
  di="${_name}-${pkgver}.dist-info"
  install -D -m644 "${di}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

