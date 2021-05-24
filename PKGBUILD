# Maintainer: Mazhar Hussain <mmazharhussainkgb1145@gmail.com>
pkgname=plymouth-theme-softwaves-manjaro-git
pkgver=5.335fcae
pkgrel=1
pkgdesc="Debian's Softwaves Plymouth theme with Manjaro branding"
arch=(any)
url="https://github.com/realmazharhussain/plymouth-theme-softwaves-manjaro"
license=('GPL v3')
depends=('plymouth')
makedepends=('bash')
provides=('plymouth-theme-softwaves-manjaro')
conflicts=('plymouth-theme-softwaves-manjaro')
source=("$pkgname"::'git+https://github.com/realmazharhussain/plymouth-theme-softwaves-manjaro.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
    cd "${pkgname}"
    mkdir -p "$pkgdir"/usr/share/plymouth/themes/softwaves-manjaro
    cp -rT "$srcdir/$pkgname"/softwaves-manjaro "$pkgdir"/usr/share/plymouth/themes/softwaves-manjaro
}
