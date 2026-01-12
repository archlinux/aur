# Maintainer: LinuxLover471 <LinuxLover471 at proton dot me>

pkgname=fastcompmgr
pkgver=0.5
pkgrel=3
pkgdesc="An early Compton-based compositor for X11 focused on performance."
arch=('x86_64')
url="https://github.com/tycho-kirchner/${pkgname}"
license=('MIT')
makedepends=('git')
depends=(
  libx11
  libxcomposite
  libxdamage
  libxfixes
  libxrender
  glibc
)
source=("git+${url}#tag=v${pkgver}")
sha512sums=('00e39237424c945888a78dcf3d2d7f6175fbec1aff2203b09f64fa9e93287bc86943d0952a1410419b365315960aa4e8521df6cd6ac76c7c17e3b75e7f81cbd8')
conflicts=(${pkgname})
provides=(${pkgname})

build() {
  cd ${pkgname}
  make
}

package() {
  cd ${pkgname}

  install -Dm755 ${pkgname} \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
