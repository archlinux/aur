# Maintainer: Yuriy Gabuev <ygabuev at mailbox.org>

pkgname=river-shifttags-git
_pkgname=river-shifttags
pkgver=0.2.2.r0.geae9a95
pkgrel=1
pkgdesc="A small utility for the river-classic Wayland compositor to rotate the focused tags"
arch=(x86_64)
url="https://gitlab.com/akumar-xyz/river-shifttags"
license=(GPL)
depends=(river-classic)
makedepends=(git)
provides=('river-shifttags')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm 755 -t "${pkgdir}/usr/bin" ./river-shifttags
  install -Dm 644 -t "${pkgdir}/usr/share/man/man1" ./river-shifttags.1
}

