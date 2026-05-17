

pkgname=uutils-coreutils-git-bin
pkgver=0.8.0.r101.g5daf0a5
pkgrel=1
pkgdesc="Rust rewrite of coreutils (latest-commit)"
url="https://github.com/uutils/coreutils/releases/download/latest-commit"
license=('MIT')
arch=('x86_64')
depends=(libgcc glibc)
provides=(coreutils)
conflicts=({uutils-,}coreutils)
source=("${url}/individual-x86_64-unknown-linux-gnu.tar.zst")
# "${url}/docs.tar.zst" has uu-
b2sums=('SKIP')
# todo: pkgver() {}
package(){
  for _b in arch kill more uptime hostname;do
    mv bin/$_b bin/uu-$_b
  done
  install -d "$pkgdir"/usr
  mv bin "$pkgdir"/usr
}
