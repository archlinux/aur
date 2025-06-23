pkgname=wumbocalculator
pkgver=1.0
pkgrel=1
pkgdesc="Simple open source calculator."
arch=('x86_64')
url="https://github.com/FedGuy699/WumboCalculator"
license=('MIT')
depends=('sdl2' 'sdl2_ttf')
makedepends=('gcc' 'pkgconf' 'git')
source=("git+https://github.com/FedGuy699/WumboCalculator.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/WumboCalculator"
  g++ main.c++ -o wumbocalculator `pkg-config --cflags --libs sdl2 SDL2_ttf`
}

package() {
  install -Dm755 "$srcdir/WumboCalculator/wumbocalculator" "$pkgdir/usr/bin/wumbocalculator"
  install -Dm644 "$srcdir/WumboCalculator/wumbocalculator.desktop" "$pkgdir/usr/share/applications/wumbocalculator.desktop"
}
