# Maintainer: zedxihan <dev@gaffarmahmud.com>
pkgname=corganizer
pkgver=2.0.0
pkgrel=1
pkgdesc="A blazing fast CLI tool to automatically organize your cluttered files"
arch=('x86_64' 'aarch64')
url="https://github.com/zedxihan/corganizer"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'make')
provides=('corganizer')
conflicts=('corganizer-git')
source=("https://github.com/zedxihan/corganizer/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('365d5d0eb183a6971380011e7c23576069aa06a397b0a6ef2cd800c58c1059e5')

build() {
  cd "${pkgname}-${pkgver}"
  make release
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
