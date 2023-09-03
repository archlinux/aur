# Maintainer: Wisker <TheWisker@protonmail.com>

pkgname=web-greeter-theme-shikai-git
pkgbase=web-greeter-theme-shikai-git
pkgver=v1.5.3
pkgrel=1
pkgdesc="Modern lightdm webkit2 theme"
arch=('any')
url="https://github.com/TheWisker/Shikai"
license=('GPL3')
depends=('lightdm' 'web-greeter')
makedepends=('git')
optdepends=()
provides=()
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
	echo "$pkgver.r$pkgrel"
}

build() {
  cd "$srcdir/Shikai/dist"
  sed -i 's/window.__is_debug = true/window.__is_debug = false/' index.html
  sed -i 's/window.__is_debug = true/window.__is_debug = false/' monitor.html
}

package() {
  mkdir -p "$pkgdir/usr/share/web-greeter/themes"
  cp -r "$srcdir/Shikai/dist" "$pkgdir/usr/share/web-greeter/themes/shikai"
}
