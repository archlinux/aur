# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# -*- sh -*-

pkgname='python-pagegen'
_pkgname="${pkgname#python-}"
pkgver=3.0.2
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
  'python'
  'python-lxml'
  'python-docutils'
)
makedepends=(
  'python-pip'
)
sha256sums=(
  '7f3c65341fc5e09459d0800d607a52237fa88d9d232f24140b59a0b2b9c999e0'
)
sha512sums=(
  '41d83217dc265575f8b2b838558b6c4e01df0e9d1f03bd5622504f3148828649c150298394d6b3df872dfe53519698798028c3a1d3ecd0d3464e6efd0fc97df8'
)
b2sums=(
  '7541c64b88ce187b98c001c9e32acb084188d5cf916b41b48a162d288ec6ebeb2d682dde23db739816647f0d495bb50ee242ab7f7a32d7720e89852266934d33'
)

package() {
  umask 0022
  pip install --no-deps --root="$pkgdir" --prefix='/usr' --compile "$srcdir/$wheel"
}

# eof
