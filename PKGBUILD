# Maintainer : Florent H. CARRÉ <colundrum@gmail.com>
pkgname=qarte
pkgver=3.7.0
pkgrel=1
pkgdesc='Allow you to browse into the archive of arte+7 & arteLiveWeb sites and to record your prefered videos.'
url='https://launchpad.net/qarte'
arch=('any')
license=('GPL3')
source=(http://ppa.launchpad.net/vincent-vandevyvre/vvv/ubuntu/pool/main/q/qarte/${pkgname}_${pkgver}.orig.tar.gz)
depends=('qt5-translations' 'python-pyqt5')
optdepends=('cronie: for differed download')
sha256sums=('f1f03975fe3129fb6aad90efb438e7311e6e0ec83a7c08f1593cb3d6d6922db7')

package() {
  cd $pkgname-$pkgver

  install -Dm755 qarte "$pkgdir"/usr/bin/qarte
  install -Dm644 qarte.1 "$pkgdir"/usr/share/man/man1/qarte.1
  install -Dm644 q_arte.desktop "$pkgdir"/usr/share/applications/q_arte.desktop
  install -Dm644 qarte.png "$pkgdir"/usr/share/pixmaps/qarte.png

  install -d "$pkgdir"/usr/share/qarte
  cp -rp * "$pkgdir"/usr/share/qarte

  mv "$pkgdir"/usr/share/qarte/locale "$pkgdir"/usr/share
  rm "$pkgdir"/usr/share/qarte/{qarte,qarte.1,q_arte.desktop,qarte.png}
}
