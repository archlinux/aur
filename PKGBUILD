# Maintainer: DanVJ <geral@danvj.pt>

pkgname=uam
pkgver=1.2.701
pkgrel=1
pkgdesc='Utopia Alternative Miner'
arch=('x86_64')
url='https://u.is'
license=('Unknown')
source=("$pkgname-$pkgver.deb::https://update.u.is/downloads/uam/linux/uam-latest_amd64.deb")
sha256sums=('b5722a6a78cff1ab2cccfcac89f352a519d7ebc75c33986f8b3fa37b26a9930e')

prepare() {
  tar xJf data.tar.xz
}

package() {
  install -d "$pkgdir"/opt \
           "$pkgdir"/usr/bin

  cp -a "${srcdir}/opt/$pkgname" "$pkgdir/opt/"
  ln -s /opt/uam/uam "$pkgdir/usr/bin/uam"
}
