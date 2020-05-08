# Maintainer: Romain Bazile <gromain.baz@gmail.com>
pkgname=shutter-encoder
pkgver=1.3ALPHA
pkgrel=1
pkgdesc="A professional video compression tool accessible to all."
arch=("x86_64")
url="https://www.shutterencoder.com/"
license=('GPL')
depends=(java-runtime ffmpeg vlc mediainfo dvdauthor mkvtoolnix-cli perl-image-exiftool dcraw p7zip libcanberra uriparser libutil-linux expat youtube-dl)
source=("https://www.shutterencoder.com/Linux/Shutter Encoder Linux Version 1.3 Alpha.tar.xz" shutter-encoder icon.png shutter-encoder.desktop)
sha256sums=('3699c0fc082b9cf365dba7ed2819af46ae9672c86a6b15e1df0ed4812449f50d'
            '0282c9ebe08ce2909f7889c13081452958aeec6843f24a159cac9522ab572636'
            'e9a5632ebbafaf9c82ae5725ea1fe4a9cbae4a0b17554527cbac5f5ad93c1ca1'
            '83d994419fcd0072069518c5d28927b09d0171935c9cd1ae6c1b3194befb5876')


package() {
  mkdir -p "$pkgdir"/usr/share/"$pkgname"/
  mkdir -p "$pkgdir"/usr/bin/
  mkdir -p "$pkgdir"/usr/share/pixmaps/
  mkdir -p "$pkgdir"/usr/share/applications/
  install -m 755 "$srcdir"/shutter-encoder "$pkgdir"/usr/bin/
  install -m 644 "$srcdir"/Shutter\ Encoder.jar "$pkgdir"/usr/share/"$pkgname"/
  install -m 644 "$srcdir"/shutter-encoder.desktop "$pkgdir"/usr/share/applications/
  install -m 644 "$srcdir"/icon.png "$pkgdir"/usr/share/pixmaps/shutter-encoder.png
  cp -r "$srcdir"/Drivers "$pkgdir"/usr/share/"$pkgname"/
  cp -r "$srcdir"/fonts "$pkgdir"/usr/share/"$pkgname"/
  cp -r "$srcdir"/Help "$pkgdir"/usr/share/"$pkgname"/
  cp -r "$srcdir"/Languages "$pkgdir"/usr/share/"$pkgname"/
  cp -r "$srcdir"/LUTs "$pkgdir"/usr/share/"$pkgname"/
  chmod -R 755 "$pkgdir"/usr/share/"$pkgname"/Drivers
  chmod -R 755 "$pkgdir"/usr/share/"$pkgname"/fonts
  chmod -R 755 "$pkgdir"/usr/share/"$pkgname"/Help
  chmod -R 755 "$pkgdir"/usr/share/"$pkgname"/Languages
  chmod -R 755 "$pkgdir"/usr/share/"$pkgname"/LUTs
}
