# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname=python-ansi
_pkgname=ansi
pkgver=0.3.6
pkgrel=1
pkgdesc='ANSI cursor movement and graphics'
arch=('any')
url='https://github.com/tehmaze/ansi'
license=('MIT')
depends=('python')
makedepends=(
  'python-pip'
  'python-typing_extensions'
)
wheel="${_pkgname}-$pkgver-py3-none-any.whl"
noextract=("$wheel")
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel"
)
# *sums taken from PyPI (blake2 is truncated, and thus invalid here)
md5sums=(
  '89e3f5726409b791f790bc7d124f8608'
)
sha256sums=(
  'a83f7e6e7a9a84f4cc2904e28e575516cf42cf862777649e57615d85ac76e11d'
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
     "$wheel"
}

# eof
