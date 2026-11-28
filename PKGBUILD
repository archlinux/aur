# Maintainer: Mikkel ALMONTE--RINGAUD <contact@vexcited.com>

_name=mime
pkgname="$_name-bin"
pkgver=0.1.0
pkgrel=1
pkgdesc='Running Windows programs on Linux by reimplementing Windows.'
arch=('x86_64')
url='https://code.vexcited.com/mime/mime'
license=('LGPL-2.1-or-later')
depends=(
  'curl'
  'glibc'
  'libgcc'
  'libstdc++'
  'libxkbcommon'
  'systemd-libs'
  'wayland'
)
optdepends=(
  'libpipewire: audio'
  'vulkan-icd-loader: direct3d rendering through vulkan'
  'xdg-utils: opening pages and url protocols in the browser'
  'desktop-file-utils: url protocols'
  'zenity: dialogs'
  'kdialog: dialogs'
)
provides=("$_name")
conflicts=("$_name")
options=('!debug' '!strip')
source=("$_name-$pkgver-x86_64-linux.tar.gz::https://github.com/vexcited/$_name/releases/download/$pkgver/$_name-x86_64-linux.tar.gz")
sha256sums=('384a604a4b05a878ad213030557bec64e7414ff22f2ca4d7500b2929a7de8ae4')

package() {
  install -Dm755 "$srcdir/$_name" "$pkgdir/usr/bin/$_name"
}
