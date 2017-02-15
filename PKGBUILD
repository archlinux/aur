# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro
pkgver=2.6.0
pkgrel=1
pkgdesc="Stitch and create 360° videos automatically with Autopano Video Pro (trial version)."
arch=('x86_64')
url='http://www.kolor.com/autopano-video/'
license=('custom: "commercial"')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"
_archiveversion=400
_archivename=AutopanoVideoPro_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/avp/stable/linux64tarxz/${pkgver}.${_archiveversion}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('398d8a2e5d87453d9629f4ae7a639b7a39900927b882d25ed5effd5ac30fb62f'
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
