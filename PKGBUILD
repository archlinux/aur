# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro
pkgver=2.5.3
pkgrel=1
pkgdesc="Stitch and create 360° videos automatically with Autopano Video Pro (trial version)."
arch=('x86_64')
url='http://www.kolor.com/autopano-video/'
license=('custom: "commercial"')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"
_archiveversion=400
_archivename=AutopanoVideoPro_Linux64_${pkgver}.tar.gz

source=("$_archivename::http://download.kolor.com/avp/stable/linux64tar/${pkgver}.${_archiveversion}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('d46623e5cb070f7d7f1a40b0c06d308e74f2c1e1b9a97a37e02b063b963c6637'
            '94c14f17f3ea2ae9e2bf1c064d90e8e2d31e3cbcca350a66b556789f13cffa82'
            '9636de580b00a33f992acbfa08b1a6252cf499e02ee2b59de0aedaefd38c76f8')

package() {
  cd "$srcdir/AutopanoVideoPro"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoVideoPro $pkgdir/opt/$pkgname
  #mv $pkgdir/opt/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
