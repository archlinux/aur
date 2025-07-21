# Maintainer: Sylvain F <thektalog@free.fr>
# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>
pkgname=qarte
pkgver=5.11.0
pkgrel=1
pkgdesc='Allow you to browse into the archive of arte+7 & arteLiveWeb sites and to record your prefered videos.'
url='https://launchpad.net/qarte'
arch=('any')
license=('GPL3')
source=(http://www.oqapy.eu/releases/${pkgname}-${pkgver}.tar.gz)
depends=('qt5-translations' 'python-pyqt5' 'qt5-svg' 'qt5-multimedia' 'python-m3u8')
optdepends=('cronie: for differed download')
sha256sums=('38bbbd1609f51a855d127b0d2902b275743ac6f1688f071b9c45c02b9c2926a3')

package() {
  cd $pkgname-$pkgver

  #rm -r "debian"

  install -Dm755 qarte "$pkgdir"/usr/bin/qarte
  install -Dm644 qarte.1 "$pkgdir"/usr/share/man/man1/qarte.1
  install -Dm644 q_arte.desktop "$pkgdir"/usr/share/applications/q_arte.desktop
  install -Dm644 qarte.png "$pkgdir"/usr/share/pixmaps/qarte.png

  install -d "$pkgdir"/usr/share/qarte
  cp -rp * "$pkgdir"/usr/share/qarte

  mv "$pkgdir"/usr/share/qarte/locale "$pkgdir"/usr/share
  rm "$pkgdir"/usr/share/qarte/{qarte,qarte.1,q_arte.desktop,qarte.png}
}
