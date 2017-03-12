# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 31/01/2017
pkgname=autopanogiga-beta
pkgver=4.4.0.302
pkgrel=1
pkgdesc='Create beautiful panoramas by stitching multiple photos automatically with Autopano Giga (BETA) (trial version).'
arch=('x86_64')
url='http://www.kolor.com/autopano/'
license=('custom: "commercial"')
provides=('autopanogiga')
install="$pkgname.install"
_archivename=AutopanoGiga_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/apg/beta/linux64tarxz/"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('ebf407e2b70a2e8ad53940f442790d5e5289893394b4b07f90efb11561c71821'
            '3fb1827030d4c1292297cc334671faa53bf11bcfda3dea419f9cab162080b1c5'
            '27fb5db94c2df0f5ad72a1d913b82397f1e084ce67caa4844126045390ae3854')

package() {
  cd "$srcdir/AutopanoGiga"
  install -dm755 $pkgdir/{opt/kolor/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoGiga $pkgdir/opt/kolor/$pkgname
  mv $pkgdir/opt/kolor/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
