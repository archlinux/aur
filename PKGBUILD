# Maintainer: Yigit Sever < yigit at yigitsever dot com>
# Contributor: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='reco'
pkgver=3.0.0
pkgrel=1
pkgdesc='Record talks to remember the contents later'
arch=('x86_64')
url='https://github.com/ryonakano/reco'
license=('GPL3')
depends=('granite' 'gstreamer')
makedepends=('meson' 'vala' 'libhandy')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('8fa57f2d0cacbae40ad7346673a07963d4429050f55776c2b936afc7afb09af3')

build() {
  arch-meson "${pkgname}-${pkgver}" build
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${pkgname}-${pkgver}/README.md"
}
