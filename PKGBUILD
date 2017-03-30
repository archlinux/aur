# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 28/01/2017
pkgname=gopro-vr-player-beta
pkgver=2.3.0.201
pkgrel=1
pkgdesc="GoPro VR Player (BETA) is a 360-degree video & photo player for desktop computers: watch 360° videos locally and enjoy professional playback features."
arch=('x86_64')
url='http://www.kolor.com/gopro-vr-player/'
license=('custom: "commercial"')
provides=('gopro-vr-player')
install="$pkgname.install"
_archivename=GoProVRPlayer_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/ked/beta/linux64tarxz/${pkgver}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('6543c2b17639d62343219b7a4143b0ef3995e3cdb1789c630022fa47a1477d5f'
            '83cbb67c737538a442dde9a41ed08ec784c34111b3adbb2ced15ea6869049b17'
            '27eb932daff89edc72e186b14f894bd9c34c60a33e10256bc341ce59a74c870d')

package() {
  cd "$srcdir/GoProVRPlayer"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/GoProVRPlayer $pkgdir/opt/$pkgname
  #mv $pkgdir/opt/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
