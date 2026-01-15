# Maintainer: LinuxLover471 <LinuxLover471 at proton dot me>

pkgname=fastcompmgr
pkgver=0.5
pkgrel=6
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
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('e067915c832540fdc63ea0ddccb0ca104e9566290925242a9ce3dc84935d10dfa20733aa666aff498319135e2ecf6d2ea1ea20ca40547c1a869d208e14cf0bde')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 ${pkgname} -t \
    "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 ${pkgname}.1 -t \
    "${pkgdir}/usr/share/man/man1/"

  install -Dm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
