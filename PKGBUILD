# Maintainer: zzzardoz <zzzardoz at mail dot de>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mtplayer
_realname=MTPlayer
_majorver=20
_minorver=2025.04.07
pkgver=${_majorver}__${_minorver}
pkgrel=1
pkgdesc="Offers access to the Mediathek of several public tv stations from DE/AT/CH"
arch=('any')
url="https://www.p2tools.de/mtplayer/"
license=('GPL3')
depends=('java-runtime>=17' 'ffmpeg')
optdepends=('vlc: play videos directly from MTPlayer')
source=("https://github.com/xaverW/${_realname}/releases/download/version-${_majorver}/${_realname}-${pkgver}.zip"
        $pkgname.desktop $pkgname.sh)
sha256sums=('1df4f5d85638503a1cdc3924f126f889e5502250c81ac9f691e89c9809a9dd43'
            '227d28958ef76fa26dfef5101cddf9a75f7b33c409f741826ae7d6974f172667'
            'e41444cc5fb59938e1532eeb7d6e9163812226dc8f5790e529858bcf4b38cd30')

package() {
  install -d "$pkgdir"/opt
  cp -r $_realname "$pkgdir"/opt
  install -Dm755 "$srcdir"/$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  install -Dm644 "$srcdir"/$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  # remove unneeded stuff
  find "$pkgdir" -name "*.exe" -exec rm {} \;
  install -Dm644 "$pkgdir"/opt/$_realname/$_realname.png "$pkgdir"/usr/share/pixmaps/MTPlayer.png
  rm "$pkgdir"/opt/$_realname/$_realname.png
}
