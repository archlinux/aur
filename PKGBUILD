# Maintainer: asyync1024 <asyync1024 at proton dot me>

pkgname=fastcompmgr
pkgver=0.5
pkgrel=8
pkgdesc="An early Compton-based compositor for X11 focused on performance."
arch=('x86_64')
url="https://github.com/tycho-kirchner/${pkgname}"
license=('MIT')
makedepends=('git')
depends=(
  'glibc'
  'libx11'
  'libxcomposite'
  'libxdamage'
  'libxfixes'
  'libxrender'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cfca9446ee92c06a294dbd710e73c2bd681eb3e26b84129827517f6ff09f0c64')

build() {
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}

  install -Dm755 ${pkgname} -t \
    "${pkgdir}/usr/bin/"

  install -Dm644 ${pkgname}.1 -t \
    "${pkgdir}/usr/share/man/man1/"

  install -Dm644 LICENSE -t \
    "${pkgdir}/usr/share/licenses/${pkgname}/"
}
