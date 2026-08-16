pkgname=eduke32-bin
pkgver=07.08.2026
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="An advanced Duke Nukem 3D source port"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/linuxbombay/eduke32"
conflicts=("eduke32" "eduke32-git")
license=('GPL')
depends=('libvpx' 'sdl2' 'flac' 'libvorbis' 'alsa-lib' 'libvpx')
makedepends=('unzip')
sha256sums=('06b355226e1133caee4d1bc419838035ce29f2c3270ad2eb90e7e801c819b0b6'
            'd52bf6e7c9c929ba74b53c79a6ee439853c0df75328437c298c1e8c7af29d8b4')
sha256sums_x86_64=('3e76bcad75fbe51d5adf9f71d85b34ba933d1443bf991e37fc12cf2d41134fa4')
sha256sums_aarch64=('a2f0feefd811d66aca23685f9894e0352ed6483e639719fcaadb4103cfcf312b')
source=('eduke32' 'mapster32')
source_x86_64=("https://gitlab.com/linuxbombay/eduke32/binaries/eduke32-$pkgver/-/raw/main/eduke32-linux-x64.tar.xz")
source_aarch64=("https://gitlab.com/linuxbombay/eduke32/binaries/eduke32-$pkgver/-/raw/main/eduke32-linux-arm64.tar.xz")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/games/eduke32"
   install -dm755 "$pkgdir/usr/lib/eduke"

   # Link to binary
   chmod +x "$srcdir/eduke32"
   cp -r "$srcdir/eduke32" "$pkgdir/usr/bin/eduke32"
   cp -r "$srcdir/eduke32" "$pkgdir/usr/bin/mapster32"
   cp -r "$srcdir"/eduke/usr/bin/* "$pkgdir/usr/share/games/eduke32/"
}
