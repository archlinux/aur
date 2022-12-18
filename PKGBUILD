# Maintainer:
# Contributor: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Luke <Infinitybeond1@protonmail.com>

pkgname=nfetch-git
pkgdesc="A minimal linux fetch utility written in nim"
pkgver=2.r19.g2655d63
pkgrel=2
arch=(x86_64)
url="https://github.com/Infinitybeond1/nfetch-src"
license=(GPL3)
makedepends=(nim git)
provides=(nfetch)
conflicts=(nfetch)
source=("git+https://github.com/Infinitybeond1/nfetch-src.git")
sha256sums=('SKIP')

pkgver() {
  cd "nfetch-src"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "nfetch-src"
  nimble build
}

package() {
  cd "nfetch-src"
  install -D nfetch -t "${pkgdir}/usr/bin/"
  install -D config.ini -t "${pkgdir}/usr/share/doc/nfetch"
}
