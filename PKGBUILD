# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Janne Heß <jannehess@gmail.com>

pkgname=birtty-git
pkgver=18.06.r0.gb693f8b
pkgrel=1
epoch=1
pkgdesc="Try not to crash that bird"
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://www.uninformativ.de/git/birtty/file/README.html"
license=(MIT)
source=("git+https://www.uninformativ.de/git/birtty.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/birtty"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/birtty"
  make
}

package() {
  cd "${srcdir}/birtty"
  install -Dm755 birtty "${pkgdir}/usr/bin/birtty"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
