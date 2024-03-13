# Maintainer: Nichlas Severinzen <ns@nsz.no>

pkgname=xsneak-git
pkgver=r3.17dbecf
pkgrel=1
pkgdesc="Simple utility for dumping linux processes using process_vm_readv"
arch=("any")
url="https://github.com/blendin/xsneak"
license=("MIT")
makedepends=("gcc" "git")
provides=("xsneak")
source=("git+https://github.com/blendin/xsneak")
sha256sums=("SKIP")

pkgver() {
  # No tags, no releases.
  cd "xsneak"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/xsneak"
  # Source makefile just does this:
  gcc xsneak.c -o xsneak
}

package() {
  cd "${srcdir}/xsneak"
  install -Dm755 xsneak "${pkgdir}/usr/bin/xsneak"
}


