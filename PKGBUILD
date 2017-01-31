# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 31/01/2017
pkgname=autopanogiga-beta
pkgver=4.4.0.200
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

sha256sums=('10e27583d86bc6fea137f9a2f1cb595cae7817943a0badfc06a5fa92f4d2324a'
            'f8d17764d0c4fb551a948b30fde19afa73a60f0d4d6fc4da425b0ac73184992c'
            '897940b591ac3e7afa21b6be54bbb59353e736c4b70326e98ca30cc6d63761ed')

package() {
  cd "$srcdir/AutopanoGiga"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoGiga $pkgdir/opt/$pkgname
  mv $pkgdir/opt/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
