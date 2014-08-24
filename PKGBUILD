# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: rabyte <rabyte__gmail>

pkgname=drascula-int
pkgver=1.1
pkgrel=1
pkgdesc='"Drascula: The Vampire Strikes Back" - Spanish, German, French and Italian AddOn'
arch=('any')
url="http://scummvm.org/"
license=('custom')
depends=('scummvm>=1.3.0' 'drascula')
source=("http://downloads.sourceforge.net/scummvm/$pkgname-$pkgver.zip")
sha256sums=('24d894925c02993d0cd59013cd228b5e5c68c77d0dc57045a2aa2aba4e344388')

package() {
  cd $pkgname-$pkgver

  # data
  install -d "$pkgdir"/usr/share/drascula
  install -m644 PACKET.* "$pkgdir"/usr/share/drascula
  # readme
  install -Dm644 readme.txt "$pkgdir"/usr/share/doc/$pkgname/readme.txt
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  tail -n 37 readme.txt > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
