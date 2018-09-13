# Maintainer: FoolEcho <foolecho at gmail dot com>
# Contributor: Emeric <emeric.grange@gmail.com>
# Contributor: dracorp
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/03/2011
pkgname=autopanogiga
pkgver=4.4.2
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

sha256sums=('a2546989f5d02fbcced61a81c65988c592af3a904eda0da4c5fad8a45a7af230'
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
