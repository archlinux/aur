# Maintainer: Wisker <TheWisker@protonmail.com>
pkgname=web-greeter-theme-shikai
pkgbase=web-greeter-theme-shikai
pkgver=1.3.0
pkgrel=4
pkgdesc="Modern lightdm webkit2 theme"
arch=('any')
url="https://github.com/TheWisker/Shikai"
license=('GPL')
depends=('lightdm' 'web-greeter')
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=('git+https://github.com/TheWisker/Shikai')
noextract=()
sha256sums=('SKIP')

package() {
  cd "$srcdir/Shikai"
  cd ./dist
  sed -i 's/window.__is_debug = true/window.__is_debug = false/' index.html
  sed -i 's/window.__is_debug = true/window.__is_debug = false/' monitor.html
  cd ../
  mkdir -p "$pkgdir/usr/share/web-greeter/themes"
  cp -r ./dist "$pkgdir/usr/share/web-greeter/themes/shikai"
}
