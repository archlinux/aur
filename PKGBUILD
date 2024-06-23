# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.3.337
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('e64569936370b2c4a7404c090027d1ec75687161a82d9d2a74d0aee6c773c709')

prepare() {
  tar xJf data.tar.xz
}

package() {
  install -d "$pkgdir"/opt \
           "$pkgdir"/usr/bin

  cp -a "${srcdir}/opt/$pkgname" "$pkgdir/opt/"
  ln -s /opt/uam/uam "$pkgdir/usr/bin/uam"
}
