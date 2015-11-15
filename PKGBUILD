# Maintainer: Patrick Wozniak <hello@patwoz.de>

pkgname=wiringop-git
pkgver=20151115.r16.7538fcb
pkgrel=2
pkgdesc="This is a modified WiringPi for OrangePi. We call it WiringOP. (git-version)"

arch=('any')
url="https://github.com/zhaolei/WiringOP"
license=('unknown')

depends=(
)
optdepends=(
)
makedepends=(
  'cmake'
  'gcc'
  'git'
)
conflicts=(
)

source=(
  "${pkgname%-git}::git+${url}.git#branch=h3"
)
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${pkgname%-git}"
  printf "%s.r%s.%s" "$(date +%Y%m%d)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"
  ./build
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 "gpio/gpio" "$pkgdir/usr/bin/gpio"
}
