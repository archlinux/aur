# Maintainer: Klaus Alexander Seistrup <klaus@seistrup.dk>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# -*- mode: sh -*-

pkgname=python-ansi
_pkgname=ansi
pkgver=0.3.1
pkgrel=1
pkgdesc='ANSI cursor movement and graphics'
arch=('any')
url='https://github.com/tehmaze/ansi'
license=('MIT')
depends=('python')
makedepends=('python-pip')
wheel="${_pkgname}-$pkgver-py3-none-any.whl"
noextract=("$wheel")
source=(
  "https://files.pythonhosted.org/packages/py3/${_pkgname::1}/$_pkgname/$wheel"
)
md5sums=(
  'c68753066a63e4277c701cdaf76b8ade'
)
sha256sums=(
  '885c7090434799e98efb40bbf0527b65ef7aa8348ac5c46f4676bef74a42ec63'
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
