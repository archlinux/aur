# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=pinch-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Small, fast screenshot tool with annotations (prebuilt)'
arch=('x86_64')
url='https://github.com/ufna/pinch'
license=('MIT')
depends=(qt6-base qt6-wayland wayland kstatusnotifieritem noto-fonts hicolor-icon-theme libgcc libstdc++ glibc)
provides=("pinch=$pkgver")
conflicts=('pinch' 'pinch-git')
options=('!strip' '!debug')
_archive="pinch-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('b3223134dee88bcbf68fb880dab8a10847a0b8de4fbb11ed1035fecc288b7087')

package() {
  bsdtar -xf "$srcdir/$_archive" -C "$pkgdir" usr
}
