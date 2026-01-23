pkgname=yick-git
pkgver=r2.b74b384
pkgrel=1
pkgdesc="AUR package browser and installer"
arch=('x86_64')
url="https://github.com/alexkuchar/yick"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
provides=('yick')
conflicts=('yick')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd yick
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd yick
  go build -o yick
}

package() {
  cd yick
  install -Dm755 yick "$pkgdir/usr/bin/yick"
}
