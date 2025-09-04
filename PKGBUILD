# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.3.789
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('8a3e1091d66963e9bfc8a9da86b0eceb78c0900a5999010aaa023aea51a6f296')

prepare() {
  tar xJf data.tar.xz
}

package() {
  install -d "$pkgdir"/opt \
           "$pkgdir"/usr/bin

  cp -a "${srcdir}/opt/$pkgname" "$pkgdir/opt/"
  ln -s /opt/uam/uam "$pkgdir/usr/bin/uam"
}
