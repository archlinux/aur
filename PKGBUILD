# Maintainer: Kailash Neupane <kailasneupane@gmail.com>
pkgname=tuf-controller
pkgver=1.0.0
pkgrel=1
pkgdesc="A simple GUI to change keyboard led color, led intensity and fan modes in asus TUF laptops"
depends=('java-runtime')
url="https://github.com/kailasneupane/tuf-controller"
arch=('i386' 'x86_64')
source=(https://github.com/kailasneupane/tuf-controller/releases/download/$pkgver/$pkgname-$pkgver.tar.gz)
md5sums=('SKIP')

package() {
  install -d "${pkgdir}"/usr/share/java/$pkgname
  cp tuf-controller.jar "${pkgdir}"/usr/share/java/$pkgname
  install -d "${pkgdir}"/usr/bin
  echo "#!/bin/bash" > "${pkgdir}"/usr/bin/$pkgname
  echo "/usr/bin/java -jar /usr/share/java/tuf-controller/tuf-controller.jar  \"\$@\"" >> "${pkgdir}"/usr/bin/$pkgname
  chmod +x "${pkgdir}"/usr/bin/$pkgname
  cd "$srcdir"
  install -m644 -D "./$pkgname.png" "$pkgdir/usr/share/icons/$pkgname.png"
  install -m644 -D "./$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
