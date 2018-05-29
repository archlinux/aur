# Maintainer: Solomon Choina <shlomochoina@gmail.com>
pkgname=bterm-bin
_pkgname=bterm
pkgver=2.0.0
pkgrel=1
pkgdesc="cross-platform terminal emulator"
arch=('x86_64')
url="https://github.com/bleenco/bterm"
license=('MIT')
provides=(bterm)
conflicts=('bterm')
depends=('nodejs')
makedepends=('unp')
source=("$url/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('cca4ca9220e9db7205b0e6e7b92fbfb7b1e59d7f01654aabe2f94f5d29cd61ff')

package() {

  tar -xf data.tar.xz
  cp -r usr $pkgdir
  cp -r opt $pkgdir

   install -Dm755 /dev/stdin "$pkgdir"/usr/bin/$_pkgname <<END
     #!/usr/bin/bash
    /opt/bterm/bterm
END
  
}
