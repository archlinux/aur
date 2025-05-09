# Maintainer: Antoine Lubineau <antoine@lubignon.info>
pkgname=0xtools
pkgver=2.0.3
pkgrel=1
pkgdesc="0x.Tools: X-Ray vision for Linux systems"
arch=("x86_64")
url="https://github.com/tanelpoder/0xtools"
license=("GPL-2.0-or-later")
depends=(
  "bash"
  "python"
)
makedepends=(
  "git"
)
source=("git::git+https://github.com/tanelpoder/0xtools#tag=v${pkgver}")
sha256sums=('f262bef6b0fea39990e2c6af176d1a8b03b5259f42eff661289387f1547f1b4b')

build() {
  cd "${srcdir}/git"
  make CFLAGS="$CFLAGS $LDFLAGS" all
}

package() {
  cd "${srcdir}/git"
  make PREFIX="${pkgdir}/usr" install
}
