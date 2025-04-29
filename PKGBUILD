# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro
pkgver=2.6.2
pkgrel=3
pkgdesc="Stitch and create 360° videos automatically with Autopano Video Pro (trial version)."
arch=('x86_64')
url='https://web.archive.org/web/20180822070241/http://kolor.com/autopano-video/'
license=('custom: "commercial"')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"

source=("https://emeric.io/CI/kolor/AutopanoVideoPro_Linux64_262_2017-05-23.tar.xz"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('f873cc22700b1805a6cb27cec1afa79e12797464029346fb6aaaa66f8d1cd8a2'
            'e8f01d2cd75a9e350d4e9b837dc342f2952f0b52125158f22f9e5b35ce71c885'
            '1c09f2253abf940361dbf38c8ae44895f553244ed7c48c6e5cdf1895383cef27')

package() {
  cd "$srcdir/AutopanoVideoPro"
  install -dm755 $pkgdir/{opt/kolor,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoVideoPro $pkgdir/opt/kolor/$pkgname
  #mv $pkgdir/opt/kolor/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
