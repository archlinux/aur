# Maintainer: Vasiliy <ldzkeymylp@gmail.com>
pkgname=osu-radio-bin
pkgver=0.1.0alpha.2
pkgrel=1
pkgdesc='Desktop music player for local osu! libraries (binary release)'
arch=('x86_64')
url='https://github.com/Jayko321/osu-radio'
license=('MIT')
depends=('glibc>=2.39' 'libgcc' 'libstdc++' 'alsa-lib' 'qt6-base>=6.12' 'qt6-declarative>=6.12' 'qt6-svg' 'qt6-wayland' 'dotnet-runtime-10.0' 'xdg-desktop-portal' 'xdg-desktop-portal-impl')
optdepends=('osu: osu!stable library' 'osu-lazer-bin: osu!lazer library')
provides=('osu-radio')
conflicts=('osu-radio' 'osu-radio-git')
options=('!strip' '!debug')
_version=0.1.0-alpha
_archive="osu-radio-${_version}-arch-x86_64"
source=("${_archive}.tar.gz::$url/releases/download/0.1.0-alpha.2/${_archive}.tar.gz")
sha256sums=('7cc13ec6b9d7f585ba95672f6b867caf33c6eb0f82bdbde8296de80c741d13c1')

package() {
  install -d "$pkgdir/usr"
  cp -r --preserve=mode "$srcdir/$_archive/usr/." "$pkgdir/usr/"
  install -Dm644 "$srcdir/$_archive/BUILD-INFO.txt" "$pkgdir/usr/share/doc/osu-radio/BUILD-INFO.txt"
  install -m644 "$srcdir/$_archive/SOURCE-FILES.sha256" "$pkgdir/usr/share/doc/osu-radio/SOURCE-FILES.sha256"
}
