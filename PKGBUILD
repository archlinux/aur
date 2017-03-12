# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 31/01/2017
pkgname=autopanopro-beta
pkgver=4.4.0.302
pkgrel=1
pkgdesc='Create beautiful panoramas by stitching multiple photos automatically with Autopano Pro (BETA) (trial version).'
arch=('x86_64')
url='http://www.kolor.com/autopano/'
license=('custom: "commercial"')
provides=('autopanopro')
install="$pkgname.install"
_archivename=AutopanoPro_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/app/beta/linux64tarxz/"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('c90090ce0367cb9a167559169e8213a7fe08ce2fb5cb67adf6655a7f5926cf74'
            'e17b9f0f43071b5d0276a506f48f1a349a10618fda718826724f29f5d3f86b55'
            'c2adb8967201d2e7d79a17992ea51829706908ad6aa39f617b8a6fa2fe10fd4e')

package() {
  cd "$srcdir/AutopanoPro"
  install -dm755 $pkgdir/{opt/kolor/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoPro $pkgdir/opt/kolor/$pkgname
  mv $pkgdir/opt/kolor/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
