# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.3.1527
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('57a8d6e7a9de0452ef9e9ec667a9bc259b6924707b41300ba4a3323315fb806d')

prepare() {
  tar xJf data.tar.xz
}

package() {
  install -d "$pkgdir"/opt \
           "$pkgdir"/usr/bin

  cp -a "${srcdir}/opt/$pkgname" "$pkgdir/opt/"
  ln -s /opt/uam/uam "$pkgdir/usr/bin/uam"
}
