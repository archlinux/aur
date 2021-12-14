# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.1.1
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
  '9a2e2025b5e059e2d7824cfa11c3c3aa37e65ba14cd0f80e581d004bc169099e'
)
sha512sums=(
  'bb54c9289077e2452f514f81efc183f78abd2c22a95a51fe63601b93757268d1af82f0e12bccd25a03bc748053f2232b46059a7da772ce751fbf9a9cb163df93'
)
b2sums=(
  'a2c71dce258bdd3236369b342b666caa0a661ac58ee01ba623b079ee76a0e15ededd2fbada7a8da7188c97fb6af5c2e19fd97ee973ae582af90420fc70bb0eea'
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
