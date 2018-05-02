# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm
pkgver=2.0.0
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
conflicts=('bterm-git')
depends=('nodejs')
makedepends=('unp')
source=("https://github.com/bleenco/bterm/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=('29660846fedd7081e28ef008acbb396db7c0b3bc71feb0ba78eb5c8ccaf1c5cb')

package() {

  tar -xf data.tar.xz
  cp -r usr $pkgdir
  cp -r opt $pkgdir

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$pkgname <<END
     #!/usr/bin/bash
    /opt/bterm/bterm
END
  
}
