# Maintainer: Nikolay Arhipov <n@arhipov.net>
pkgname=vitasdk-packages-git
pkgver=1
pkgrel=1
pkgdesc="Packages pre-built with VITASDK homebrew toolchain for Sony Playstation Vita"
arch=('i686' 'x86_64')
url="https://github.com/vitasdk/packages/"
license=('MIT' 'GPL')
options=(!strip)
depends=(
  'vitasdk'
)
makedepends=(
  'wget'
  'git'
)
provides=(
  'vitasdk-packages'
)
source=("git+https://github.com/vitasdk/vdpm")
md5sums=('SKIP')

package() {
  export VITASDK="$pkgdir/opt/vitasdk"
  mkdir -p "$VITASDK/arm-vita-eabi"
  cd "vdpm"
  export CLEAN=1
  ./install-all.sh
}
