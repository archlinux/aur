# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.5.0
pkgrel=2
pkgdesc='Python static site generator with reStructuredText markup'
arch=('any')
license=('GPL')
url='https://pagegen.phnd.net/'
wheel="${_pkgname}-$pkgver-py3-none-any.whl"
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel"
)
depends=(
  'python-docutils'
  'python-htmlmin'
  'python-jsmin'
  'python-lxml'
  'python-libsass'
  'python-mako'
  'python-markdown'
  'python-markupsafe'
  'python-rcssmin'
  'python-six'
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
  'f7ec451a826bb27fb4dd4c5db6eb54a81c4f2c64e24d027d313e6903c5a9a158'
)
sha512sums=(
  '6ad29f3e50fe9fc70b6b76e95da0ab3a4a29ff902cd6f6797fb4dd21f6c3a32f020c18483e24954fdf64127532f5d5273eb784bf66c617492906c2f08792af5c'
)
b2sums=(
  '8ebfe61cec0ecca1671bb3347b27114b9df7b879301df052533faa471d83a10e3a88cde0744452503cffe9a3d3c89eef125e40fc0990581738acbe439848e778'
)

# eof
