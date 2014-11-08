# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=arcade-command-dat
pkgver=20070221
pkgrel=1
pkgdesc="Arcade Database file to display fighting move commands in Emulators"
arch=('any')
url="http://home.comcast.net/~plotor/command.html"
license=('unknown')
optdepends=('raine: for use in raine')
source=("http://home.comcast.net/~plotor/commandsh.zip")
sha256sums=('cc39822daa0c68cf659ebcdc0edf6d09cd5a41c8cb503c3db745114969907120')

package() {
  install -Dm644 command.dat "$pkgdir"/usr/share/$pkgname/command.dat

  # symlink for use in raine
  install -d "$pkgdir"/usr/share/raine
  ln -s /usr/share/$pkgname/command.dat "$pkgdir"/usr/share/raine/command.dat

  # TODO: where to put it for other emulators/frontends?

  # doc
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 *.txt "$pkgdir"/usr/share/doc/$pkgname
}
