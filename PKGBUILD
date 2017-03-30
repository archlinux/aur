# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: Emeric <emeric.grange@gmail.com>
# Contributor: dracorp
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/03/2011
pkgname=autopanogiga
pkgver=4.4.0
pkgrel=1
pkgdesc='Create beautiful panoramas by stitching multiple photos automatically with Autopano Giga (trial version).'
arch=('x86_64')
url='http://kolor.com/autopano/'
license=('custom: "commercial"')
install="$pkgname.install"
changelog=ChangeLog
_archiveversion=400
_archivename=AutopanoGiga_Linux64_${pkgver}.tar.xz

source=("$_archivename::http://download.kolor.com/apg/stable/linux64tarxz/${pkgver}.${_archiveversion}"
        "$pkgname"
        "$pkgname.desktop")

sha256sums=('ab849d5c86802b55466265e4067acd7d7606d7e79e33b97413681cb8ee5a2d4b'
            '145569fd59808c0b2241189908a8d6fd9fbce0772e7fd40f0fbaa713313d4a3b'
            'a7456db2e25dc33952ee42202edf31b070493e157945d40a4645187a1d49336b')

package() {
  cd "$srcdir/AutopanoGiga"
  install -dm755 $pkgdir/{opt/kolor/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoGiga $pkgdir/opt/kolor/$pkgname
  mv $pkgdir/opt/kolor/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
