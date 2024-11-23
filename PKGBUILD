# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Wu, Zhenyu <wuzhenyu@ustc.edu>
pkgname=ansi2knr
pkgver=0.0.1
pkgrel=1
pkgdesc="convert ANSI C to Kernighan and Ritchie C"
arch=(i686 x86_64 arm aarch64)
url=https://www.unix.com/man-page/redhat/1/ansi2knr
license=(GPL3)
source=("https://sources.debian.org/data/main/g/gmp/2%3A4.3.2%2Bdfsg-1/ansi2knr.c")
sha256sums=('cd23796f08e50765510d849e6d2eaf7298c657bb052fa905796c687c80aec18d')

build() {
  cc ansi2knr.c -O2 -oansi2knr -DSTDC_HEADERS
}

package() {
  install -D ansi2knr -t "$pkgdir/usr/bin"
}
