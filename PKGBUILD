pkgname=osu-radio-bin
pkgver=0.1.0prealpha.3
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
_version=0.1.0-alpha.3
_archive="osu-radio-${_version}-arch-x86_64"
source=("${_archive}.tar.gz::$url/releases/download/v${_version}/${_archive}.tar.gz")
# T09 replaces this deliberately invalid digest with the final release asset SHA-256.
sha256sums=('3f1a3b01d12944e02d661d74894eec3e5a768d4bfce1cdc3bd20b7784e58a7d9')

package() {
  install -d "$pkgdir/usr"
  cp -r --preserve=mode "$srcdir/$_archive/usr/." "$pkgdir/usr/"
  install -Dm644 "$srcdir/$_archive/BUILD-INFO.txt" "$pkgdir/usr/share/doc/osu-radio/BUILD-INFO.txt"
  install -m644 "$srcdir/$_archive/SOURCE-FILES.sha256" "$pkgdir/usr/share/doc/osu-radio/SOURCE-FILES.sha256"
}
