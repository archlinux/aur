pkgname=fheroes2-bin
_pkgname=FHeroes2-bin
pkgver=1.1.9
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
sha256sums_x86_64=('e1ca27f3eaa3a9fff9763404cca98dd364249176bf3f06642d8335ea1098ead3')
sha256sums_aarch64=('d95ab9e54906e253bf01597bd333cf9d666e0eaf26f37c86e994f6e40586fa1b')
source=("fheroes2.desktop")
source_x86_64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_x86-64_SDL2.zip")
source_aarch64=("https://github.com/ihhub/fheroes2/releases/download/$pkgver/fheroes2_ubuntu_arm64_SDL2.zip")


package() {
   install -dm755 "$pkgdir/usr/bin"
   install -dm755 "$pkgdir/usr/share/fheroes2"
   install -dm755 "$pkgdir/usr/share/applications"
   
   cp -r "$srcdir/." "$pkgdir/usr/share/fheroes2"
   install -Dm755 "$srcdir/fheroes2" "$pkgdir/usr/bin"
   install -Dm755 "$srcdir/fheroes2.desktop" "$pkgdir/usr/share/applications"
}
