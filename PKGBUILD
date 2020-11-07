# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='gitscover'
pkgver=1.2.5
pkgrel=1
pkgdesc='Discover new GitHub repositories'
arch=('x86_64')
url='https://github.com/linuxhubit/gitscover'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a0593cfcfdfe0c8bb7efe85bad18eac1d46b8ba697c6f7c5f45b97dd9de218d6')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
