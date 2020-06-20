# Maintainer: Butui Hu <hot123tea123@gmail.com>

_name=imagecodecs
_py=cp38
pkgname=python-imagecodecs
pkgver=2020.2.18
pkgrel=1
pkgdesc="A Python library that provides block-oriented, in-memory buffer transformation, compression, and decompression functions for use in the tifffile, czifile, and other scientific imaging modules"
arch=('x86_64')
url="https://pypi.org/project/imagecodecs"
license=('BSD')
depends=(python)
makedepends=(python-pip)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/${_py}/${_name::1}/${_name}/${_name/-/_}-${pkgver}-${_py}-${_py}-manylinux2014_x86_64.whl")
sha256sums=('e0f3cfc2fc77c19118e173dca6af0dbed4a3cef75d3296762db687fd00fb7921')

package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps *.whl
  python -O -m compileall "${pkgdir}"
}

# vim:ts=2:sw=2:et:
