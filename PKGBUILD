# Contributor: Doug Newgard <scimmia at archlinux dot org>

pkgname=beersmith
pkgver=3.0.9
pkgrel=1
pkgdesc='Complete software suite for brewers'
arch=('x86_64')
url='https://beersmith.com'
license=('commercial')
source_x86_64=("https://s3.amazonaws.com/beersmith-${pkgver%%.*}/BeerSmith-${pkgver}_amd64.deb")
sha256sums_x86_64=('ca22f487889beecaa22de6decfd263a76cf7cf92290a6bb4a55b455ba5ae21ea')

package() {
  depends=('cairo' 'fontconfig' 'gcc-libs' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
           'libpng' 'libsm' 'libx11' 'libxxf86vm' 'openssl' 'pango' 'webkit2gtk' 'zlib')

  bsdtar -xf data.tar.xz -C "$pkgdir"

  rm -r "$pkgdir"{/etc/,/usr/share/menu/}
  install -dm755 "$pkgdir/usr/share/licenses/$pkgname"
  ln -sr "$pkgdir/usr/share/BeerSmith${pkgver%%.*}/license.rtf" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
