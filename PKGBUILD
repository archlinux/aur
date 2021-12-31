# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.2.0
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
  '3ac47f4b09c887ca404c2d7e5aff9bcc4b1c6de75500c4d46f6a9441d266694f'
)
sha512sums=(
  'f6e02e5c4355c9e00c988e33b16fde5154cd93c61f73c6a221a7da1ca96d0e083af1242e4c2c2c12f30eb1c6eeec05615111a818a4d4eee2ddbf4defdcb33ba8'
)
b2sums=(
  'c9bfc00e87a17b7a7da3cc215e89ea37205f8da619bc23b3d2621efc1d42c2cdf2593b467afe4255b3c757fcd018f3ed6666d1df8ef8cec9871864cb165931d2'
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
