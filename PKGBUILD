# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.3.19
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('9178bd531439d337edb9de8eabec8943ec1637405771b6f0b45f0c680ed5fd87')

prepare() {
  tar xJf data.tar.xz
}

package() {
  install -d "$pkgdir"/opt \
           "$pkgdir"/usr/bin

  cp -a "${srcdir}/opt/$pkgname" "$pkgdir/opt/"
  ln -s /opt/uam/uam "$pkgdir/usr/bin/uam"
}
