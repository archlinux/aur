# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.4.0
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
  'python-mako'
  'python-rcssmin'
)
makedepends=(
  'python-pip'
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

sha256sums=(
  '2de6675def19fdb96acb16fa7be9004b007b084a756bb1b5cdf5292ec04fc83b'
)
sha512sums=(
  '360a048152e927ab9c58ebd3623e7019b070207461f78084a6bd3c695a055e702230684ad57f6f6b85477d045d9d93ee9c4d2f36ba27816988ed8344b288441a'
)
b2sums=(
  '4950cf48994caa1f2115c1bdd5b4a87e91fe775799121272936e9a7e0320b007725804489d616df0c4ca8c0268952813af86712e75577f615fbdce8a297f5e0b'
)

# eof
