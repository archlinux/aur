# Maintainer: carstene1ns <url/mail: arch carsten-teibes de>
# Contributor: Dennis Hamester <dennis.hamester [AT] gmail [DOT] com>

pkgname=dreamweb-de
pkgver=1.0
pkgrel=1
pkgdesc="A top-down adventure game set in a gritty futuristic dystopian city - german language"
arch=('any')
url="http://www.scummvm.org/"
license=('custom: Freeware')
depends=('scummvm')
source=("http://downloads.sourceforge.net/scummvm/dreamweb-cd-de-$pkgver.zip"
        "$pkgname.sh")
sha256sums=('3ee073377dcf1c478946460d13ca96d736b5b0a7f6a97fa93148c525aab6d81f'
            'dc4994ce76ae22cefce421db3b963c53df0466172013f08bd1cb3e1cc900bd12')
# avoids unnecessary stripping and recompression
options=('!strip')
PKGEXT='.pkg.tar'

package() {
  # launcher
  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname

  # data
  install -d "$pkgdir"/usr/share/$pkgname/speech
  install -m644 DREAMWEB.* "$pkgdir"/usr/share/$pkgname
  install -m644 track01.flac "$pkgdir"/usr/share/$pkgname
  install -m644 SPEECH/*.RAW "$pkgdir"/usr/share/$pkgname/speech
  rm "$pkgdir"/usr/share/$pkgname/DREAMWEB.EXE

  # license
  install -Dm644 license.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
