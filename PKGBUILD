# Maintainer: Emeric <emeric.grange@gmail.com>
# Created: 12/12/2016
pkgname=gopro-vr-player
pkgver=2.3.1
pkgrel=2
pkgdesc="GoPro VR Player is a 360-degree video & photo player for desktop computers: watch 360° videos locally and enjoy professional playback features."
arch=('x86_64')
url='http://www.kolor.com/gopro-vr-player/'
license=('custom: "commercial"')
depends=('libidn11')
install="$pkgname.install"
_archiveversion=400
_archivename=GoProVRPlayer_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/ked/stable/linux64tarxz/${pkgver}.${_archiveversion}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('8d5aa41ccfb4a6368f5816c958d0a59b2421394de440ffda620fafedb38886ff'
            'edda581c5ee19c9bf5474d9bf564b5ae7d39f6d866d0d55cc5e28728b5acf226'
            '303b077174a22d2625202da52a1dbf528766ba91159f75443cbd68498e6a0b5a')

package() {
  cd "$srcdir/GoProVRPlayer"
  install -dm755 $pkgdir/{opt/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/GoProVRPlayer $pkgdir/opt/$pkgname
  #mv $pkgdir/opt/$pkgname/Copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
