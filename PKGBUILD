# Maintainer: fish4terrisa-MSDSM flyingfish.msdsm@gmail.com
pkgname=jellyfetch-git
pkgver=32617eb
pkgrel=1
pkgdesc="A Jelly Hoshiumi themed neofetch parody written in C just for lulz."
arch=(x86_64 i686 pentium4 armv7h aarch64 riscv64)
url="https://github.com/jffops/jfetch"
license=(MIT)
depends=(glibc gcc-libs)
makedepends=(gcc)
source=("git+https://github.com/jffops/jfetch.git")
sha256sums=("SKIP")

pkgver() {
  cd "${srcdir}"/jfetch
  git describe --long --tags --always
}

build() {
  cd "${srcdir}"/jfetch
  gcc -o jellyfetch -Wall -Wextra jfetch.c
}

package() {
  cd "${srcdir}"/jfetch
  install -Dm755 jellyfetch -t "$pkgdir/usr/bin"
  install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
