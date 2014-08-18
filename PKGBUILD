# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=arcade-history-dat
pkgver=154c
pkgrel=1
pkgdesc="Arcade History Database file to use for Emulators and Frontends with more than 36,000 entries!"
arch=('any')
url="http://www.arcade-history.com"
license=('unknown')
optdepends=('raine: for use in raine'
            'qmc2: for use in qmc2')
source=("$url/dats/history$pkgver.7z")
sha256sums=('ab34365153f7aed3d7a910f7e6b6e91007833a1f01bc0c0b0c63eb50f9895673')

package() {
  install -Dm644 history.dat "$pkgdir"/usr/share/$pkgname/history.dat

  # symlink for use in raine
  install -d "$pkgdir"/usr/share/raine
  ln -s /usr/share/$pkgname/history.dat "$pkgdir"/usr/share/raine/history.dat

  # TODO: where to put it for other emulators/frontends?
}
