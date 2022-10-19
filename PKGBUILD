# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='gitscover'
pkgver=1.2.6
pkgrel=1
pkgdesc='Discover new GitHub repositories'
arch=('x86_64')
url='https://github.com/linuxhubit/gitscover'
license=('GPL3')
depends=('granite')
makedepends=('meson' 'vala' 'libsoup')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('1d6b2f1196c036bed0e64527c34828b37c132553a0993a5ae6d0c942de5b0954')

build() {
  arch-meson "${pkgname}-${pkgver}" 'build'
  meson compile -C 'build'
}

package() {
  DESTDIR="${pkgdir}" meson install -C 'build'
  install -Dvm644 "${pkgname}-${pkgver}/README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
