# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro-beta
pkgver=2.6.0
pkgrel=1
pkgdesc="Stitch and create 360° videos automatically with Autopano Video Pro BETA (trial version)."
arch=('x86_64')
url='http://www.kolor.com/autopano-video/'
license=('custom: "commercial"')
provides=('autopanovideopro')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"
_archiveversion=301
_archivename=AutopanoVideoPro_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/avp/beta/linux64tarxz/${pkgver}.${_archiveversion}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('e44cd045d6f80474a3406b938149386d6df45c9673ac6061ac96a4ba35f392d6'
            '01a9af96991be9060b249c28b7d3c95a0e0a496aee8d2b484558a26c0b64f368'
            'a78bd15fa99766d63f4673b15c65546677eed8b982840fd5b7aa21f5342d044c')

package() {
  cd "$srcdir/AutopanoVideoPro"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoVideoPro $pkgdir/opt/$pkgname
  #mv $pkgdir/opt/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
