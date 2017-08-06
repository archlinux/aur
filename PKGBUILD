# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro-beta
pkgver=3.0.0.302
pkgrel=1
pkgdesc="Stitch and create 360° videos automatically with Autopano Video BETA (trial version)."
arch=('x86_64')
url='http://www.kolor.com/autopano-video/'
license=('custom: "commercial"')
provides=('autopanovideopro', 'autopanovideo')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"
_archivename=AutopanoVideo_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/avp/beta/linux64tarxz/${pkgver}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('a0c7caf7f98e0b673cfe548290d9173e7556f7ed8ea6148e46617b40f385db88'
            '8e9dd924c10ab925f80860c9889ab98d60c2aac35918b2331dffc2730d67383e'
            'b141169e00ed7eb582c2c29e4555e81c03390f75a0af619b12f014f40f660b04')

package() {
  cd "$srcdir/AutopanoVideo"
  install -dm755 $pkgdir/{opt/kolor,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoVideo $pkgdir/opt/kolor/$pkgname
  #mv $pkgdir/opt/kolor/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
