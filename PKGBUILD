# Maintainer: Emeric <emeric.grange@gmail.com>
# MaintContributorainer: FoolEcho <foolecho at gmail dot com>
# Contributor: dracorp
# Contributor: Piotr Rogoża <rogoza dot piotr at gmail dot com>
# Created: 18/03/2011
pkgname=autopanogiga
pkgver=4.4.2
pkgrel=5
pkgdesc='Create beautiful panoramas by stitching multiple photos automatically with Autopano Giga.'
arch=('x86_64')
url='https://web.archive.org/web/20180822070241/http://kolor.com/autopano/'
license=('custom: "commercial"')
install="$pkgname.install"
changelog=ChangeLog

source=("https://emeric.io/CI/kolor/AutopanoGiga_Linux64_442_2018-09-10.tar.xz"
        "$pkgname"
        "$pkgname.png"
        "$pkgname.desktop")

sha256sums=('a2546989f5d02fbcced61a81c65988c592af3a904eda0da4c5fad8a45a7af230'
            '80114777faed6326764d14143f533efb473695d99e1771b2fdfbae89f3942fad'
            '0ea1b5efe83ef091c629cf9615df306440131586235f1ae7b41856c9b6ddcd6b'
            'a7456db2e25dc33952ee42202edf31b070493e157945d40a4645187a1d49336b')

package() {
  cd "$srcdir/AutopanoGiga"
  install -dm755 $pkgdir/{opt/kolor/,usr/share/licenses/$pkgname/}
  cp -r $srcdir/AutopanoGiga $pkgdir/opt/kolor/$pkgname
  cp $srcdir/$pkgname.png $pkgdir/opt/kolor/$pkgname/Resources/UI/autopano_giga.png
  mv $pkgdir/opt/kolor/$pkgname/copyright $pkgdir/usr/share/licenses/$pkgname/
  install -Dm755 $srcdir/$pkgname $pkgdir/usr/bin/$pkgname
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}

