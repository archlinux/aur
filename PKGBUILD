# Maintainer: zzzardoz <zzzardoz at mail dot de>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Soeren Koerner <nonick at posteo dot de>
# Contributor: Benedikt 'linopolus' Mueller <benemue at googlemail dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mtplayer
_realname=MTPlayer
_majorver=17
_minorver=2024.06.01
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
sha256sums=('464b512c51fbe07e50f6a20ab0e7bee928cf7e2d56e5d4778a6093d87cb04fc2'
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
