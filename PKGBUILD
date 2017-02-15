# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=autopanovideopro-beta
pkgver=2.6.0.400
pkgrel=1
pkgdesc="Stitch and create 360° videos automatically with Autopano Video Pro BETA (trial version)."
arch=('x86_64')
url='http://www.kolor.com/autopano-video/'
license=('custom: "commercial"')
provides=('autopanovideopro')
optdepends=('autopanogiga: Edit control points manually'
            'gopro-vr-player: 360 video player')
install="$pkgname.install"
_archivename=AutopanoVideoPro_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/avp/beta/linux64tarxz/${pkgver}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('398d8a2e5d87453d9629f4ae7a639b7a39900927b882d25ed5effd5ac30fb62f'
            '7edfb228537cf3af07c1c622b49b671470d842447d59450e56dc151c7beb3454'
            'fa33f467c326970ea9cbc45c697b1230adb3f24f5d6f50aca52e1faad74381e5')

package() {
  cd "$srcdir/AutopanoVideoPro"
  install -dm755 $pkgdir/{opt/kolor,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoVideoPro $pkgdir/opt/kolor/$pkgname
  #mv $pkgdir/opt/kolor/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
