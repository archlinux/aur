# Maintainer: Mikkel ALMONTE--RINGAUD <contact@vexcited.com>

pkgname=mime-bin
_pkgname=mime
pkgver=0.0.2
pkgrel=1
pkgdesc='Running Windows programs on macOS and Linux by reimplementing Windows'
arch=('x86_64')
url='https://github.com/vexcited/mime'
license=('LGPL-2.1-or-later')
depends=(
  'curl'
  'glibc'
  'libgcc'
  'libstdc++'
  'sdl3'
  'systemd-libs'
  'wayland'
)
optdepends=(
  'libpipewire: audio output'
  'vulkan-icd-loader: direct3d rendering through vulkan'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source=("$_pkgname-$pkgver-x86_64-linux.tar.gz::$url/releases/download/$pkgver/$_pkgname-x86_64-linux.tar.gz")
sha256sums=('b2b69b4562a941f68aa9cbb972381f58cc58c54842b2c6be11df27ddce350534')

package() {
  install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
