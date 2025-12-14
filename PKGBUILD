# Maintainer: LinuxLover471

pkgname=fastcompmgr
pkgver=0.5
pkgrel=2
pkgdesc="An early Compton-based compositor for X11 focused on performance."
arch=('x86_64')
url="https://github.com/tycho-kirchner/fastcompmgr"
license=('MIT')
makedepends=('git')
depends=(
  libx11
  libxcomposite
  libxdamage
  libxfixes
  libxrender
  libxcb
  libxau
  libxdmcp
  glibc
)
source=("git+$url#tag=v$pkgver")
sha512sums=('00e39237424c945888a78dcf3d2d7f6175fbec1aff2203b09f64fa9e93287bc86943d0952a1410419b365315960aa4e8521df6cd6ac76c7c17e3b75e7f81cbd8')
conflicts=("fastcompmgr")
provides=("fastcompmgr")

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}

  install -Dm755 fastcompmgr \
    "${pkgdir}/usr/bin/fastcompmgr"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
