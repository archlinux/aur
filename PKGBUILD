# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 28/01/2017
pkgname=gopro-vr-player-beta
pkgver=2.3.1.400
pkgrel=1
pkgdesc="GoPro VR Player (BETA) is a 360-degree video & photo player for desktop computers: watch 360° videos locally and enjoy professional playback features."
arch=('x86_64')
url='http://www.kolor.com/gopro-vr-player/'
license=('custom: "commercial"')
provides=('gopro-vr-player')
install="$pkgname.install"
_archivename=GoProVRPlayer_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/ked/stable/linux64tarxz/${pkgver}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('8d5aa41ccfb4a6368f5816c958d0a59b2421394de440ffda620fafedb38886ff'
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
