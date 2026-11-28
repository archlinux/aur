# Maintainer: Vladimir Alyamkin <ufna@ufna.dev>
pkgname=pinch-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Small, fast screenshot tool with annotations (prebuilt)'
arch=('x86_64')
url='https://github.com/ufna/pinch'
license=('MIT')
depends=(qt6-base qt6-wayland wayland noto-fonts hicolor-icon-theme libgcc libstdc++ glibc)
provides=("pinch=$pkgver")
conflicts=('pinch' 'pinch-git')
options=('!strip' '!debug')
_archive="pinch-$pkgver-$pkgrel-x86_64.pkg.tar.zst"
source=("$url/releases/download/v$pkgver/$_archive")
noextract=("$_archive")
sha256sums=('ad97c2cf1cc1dc1d7a07c92e7b91900d076986f0e1927d808f9cbbe5a77010fe')

package() {
  bsdtar -xf "$srcdir/$_archive" -C "$pkgdir" usr
}
