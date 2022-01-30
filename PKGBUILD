# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname=python-ansi
_pkgname=ansi
pkgver=0.3.4
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
# *sums taken from PyPI
md5sums=(
  '7c65af0400ca38c5b860d70dd0934601'
)
sha256sums=(
  '8638378a838f81c34031e52410622d3c0af45379e55ba74cdca17590f35a84e8'
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
