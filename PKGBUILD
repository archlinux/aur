# Maintainer: Konstantinos Foutzopoulos <mail@konfou.xyz>

pkgname=soundfont-arachno
pkgver=1.0
pkgrel=1
pkgdesc="GM/GS soundbank courtesy of Maxime Abbey."
arch=('any')
url="http://www.arachnosoft.com"
license=("custom")
groups=('soundfonts')
#source=("ftp://downloads.arachnosoft.com/gqeqhzbs/arachnosoft/files/soundfonts/arachno-soundfont-${pkgver/./}-sf2.zip")
source=("https://www.dropbox.com/s/2rnpya9ecb9m4jh/arachno-soundfont-${pkgver/./}-sf2.zip")
md5sums=('893e9ff89bc24a23ecffa9e644cb12f4')

package() {
  install -Dm644 "Arachno SoundFont - Version ${pkgver}.sf2" "$pkgdir/usr/share/soundfonts/Arachno.sf2"
  sed -n -e 1,2p -e 44,54p 'Read Me.txt' > LICENSE
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
