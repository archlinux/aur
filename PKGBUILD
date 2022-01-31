# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname=python-ansi
_pkgname=ansi
pkgver=0.3.5
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
  '68489efd6843cd960ed38df8ae43e47a'
)
sha256sums=(
  'b66ffd2b457d8ba255b78a22ec422f0ba129739e567bd6efee383d5a6b07e06f'
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
