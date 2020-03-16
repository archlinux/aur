# Maintainer: Olegs Jeremejevs <olegs@jeremejevs.com>

pkgname=asdf-vm
pkgver=0.7.7
pkgrel=1
pkgdesc='Extendable version manager with support for Ruby, Node.js, Elixir, Erlang & more'
arch=('any')
url='https://asdf-vm.com'
license=('MIT')
depends=(
  'autoconf'
  'automake'
  'libffi'
  'libtool'
  'libxslt'
  'libyaml'
  'ncurses'
  'openssl'
  'readline'
  'unixodbc'
)
optdepends=('unzip: Needed by some plugins, like Elixir')
install=asdf-vm.install
source=("https://github.com/asdf-vm/asdf/archive/v${pkgver}.tar.gz")
sha256sums=('9d8dccb333aad86d626fe559a1e481fc74b740839be3a3bb99e83d0b0b2b552d')

package() {
  cd "asdf-${pkgver}"

  local dst="${pkgdir}/opt/${pkgname}"
  mkdir -p "${dst}"

  cp -r bin "${dst}"
  cp -r completions "${dst}"
  cp -r lib "${dst}"
  cp asdf.fish "${dst}"
  cp asdf.sh "${dst}"
  cp defaults "${dst}"
  cp help.txt "${dst}"
  cp LICENSE "${dst}"
  cp VERSION "${dst}"

  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE 
}
