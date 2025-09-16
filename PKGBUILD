pkgname=fheroes2-bin
_pkgname=FHeroes2-bin
pkgver=1.1.11
pkgrel=1
_pkgrel_x86_64=1
_pkgrel_aarch64=1
pkgdesc="Modern open source Engine to play Heroes of Might and Magic 2, you will need to provide your own game files to play Heroes of Might and Magic 2."
arch=('x86_64' 'aarch64')
url="https://github.com/ihhub/fheroes2"
conflicts=("fheroes2" "fheroes2-git")
license=('GPL')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
makedepends=('unzip')
sha256sums=('9ff72917638d3c1870bf676556bdf09944cf5d8cff11e40c70640385fb869ad3')
sha256sums_x86_64=('affa210e606e947d946a1a4de714babba7e94668c15bc0e2974f75ed2acd5640')
sha256sums_aarch64=('d9feb31cdb5e7e4ae9a36b4c216d6be70950e1649bd992a2627cb6f71f3d55b4')
source=("fheroes2.desktop")
source_x86_64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_x86-64_SDL2.zip")
source_aarch64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_arm64_SDL2.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/fheroes2"
   install -dm755 "$pkgdir/usr/share/applications"
   
   rm -rf "${srcdir}"/*.zip
   cp -r "$srcdir/." "$pkgdir/usr/share/fheroes2"
   install -Dm755 "$srcdir/fheroes2" "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications"
}
