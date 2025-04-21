# Contributor: Mike Polvere <mic.tjs@gmail.com>
# Contributor: Tomasz Paś <kierek93@gmail.com>

pkgname=libretro-xrick-git
pkgver=r203.476a9a6
pkgrel=1
pkgdesc="libretro port of xrick"
arch=('x86_64')
url="https://github.com/libretro/xrick-libretro"
license=('custom')
depends=('glibc')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "${pkgname}"
  make
}

package() {
  cd "${pkgname}"
  install -Dm644 "xrick_libretro.so" -t "${pkgdir}/usr/lib/libretro/"
  install -Dm644 README "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
