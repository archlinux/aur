# Maintainer: Nia Schlegel <nia@3nt3.de>

pkgname=ttf-newsreader
pkgver=2021.03.01
pkgrel=1
pkgdesc='Newsreader, a text and display serif typeface for on-screen reading by Production Type'
arch=('any')
url='https://github.com/productiontype/Newsreader'
license=('OFL-1.1')
_commit='cfcb4f7af0e52c25e8df2a2431814c8e5fe2e155'
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('e6726fdd7a4791fe586142a7e60c9a37d4fa26da7515634f91ba56a489022d7a')

package() {
  cd "Newsreader-$_commit"

  # Install variable font files (single family with opsz and wght axes)
  install -Dm644 fonts/variable/ttf/*.ttf -t "$pkgdir/usr/share/fonts/TTF/"

  # Install license
  install -Dm644 OFL.txt "$pkgdir/usr/share/licenses/$pkgname/OFL.txt"
}
