# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.3.2
pkgrel=1
pkgdesc='Python static site generator with reStructuredText markup'
arch=('any')
license=('GPL')
url='http://pagegen.phnd.net/'
wheel="${_pkgname}-$pkgver-py3-none-any.whl"
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel"
)
depends=(
  'python-docutils'
  'python-htmlmin'
  'python-jsmin'
  'python-lxml'
  'python-rcssmin'
)
makedepends=(
  'python-pip'
)
sha256sums=(
  '6558ce3413e81f1db3312b9684db408f65c1ca5da154f355e26fc39d6f96101a'
)
sha512sums=(
  '8d3f511d321c06ed95bc5669abe443bd8f9d84f07af2cefa58eb47e13844eae3e0b1065e3016a18d1d83ab1b0739c23d735d10b0aa7effc284e45bdcd4ed4578'
)
b2sums=(
  'b0d5b17bd05bf2ffde72616c7c24fadc300db19de55c1ff2a93880ef090281b01bdf3febbf7ce5761c04b0d8e01bfcb3d700aa3a75a9b769250454b9a9565470'
)

package() {
  umask 0022
  pip install \
    --force-reinstall \
    --ignore-installed \
    --no-warn-script-location \
    --no-deps \
    --compile \
    --root="$pkgdir" \
    --prefix='/usr' \
      "$srcdir/$wheel"
}

# eof
