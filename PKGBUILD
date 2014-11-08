# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=arcade-history-dat
pkgver=155
pkgrel=1
pkgdesc="Arcade History Database file to use for Emulators and Frontends with more than 36,000 entries!"
arch=('any')
url="http://www.arcade-history.com"
license=('custom')
optdepends=('raine: for use in raine'
            'qmc2: for use in qmc2')
source=("$url/dats/history$pkgver.7z")
sha256sums=('05e8bec9c2f3f1747e4f5bf772a68289191c1e4d3ec9938d8d806056d8a4aab6')

package() {
  install -Dm644 history.dat "$pkgdir"/usr/share/$pkgname/history.dat

  # symlink for use in raine
  install -d "$pkgdir"/usr/share/raine
  ln -s /usr/share/$pkgname/history.dat "$pkgdir"/usr/share/raine/history.dat

  # TODO: where to put it for other emulators/frontends?

  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  sed '/$end/,$d' history.dat > "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
