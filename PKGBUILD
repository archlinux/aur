# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgdesc="XDG sound theme for the unexicon distribution"
pkgname=unexicon-sound-theme
pkgver=1.1
pkgrel=1
arch=('any')
license=('GPL')
url="https://github.com/bbidulock/${_pkgname}"
groups=('unexicon')
depends=('sound-theme-freedesktop' 'sound-theme-smooth' 'linux-a11y-sound-theme')
makedepends=('git' 'pkgconfig' 'flite' 'flite-voices' 'sox')
source=("https://github.com/bbidulock/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.lz")
sha256sums=('5994ff1c2af4903d3ac31f5926ea931f2a129126af6e94cd0e613c8b22bc5af4')

build() {
  cd ${pkgname}-${pkgver}
  ./configure
  make
}

package() {
  make -C ${pkgname}-${pkgver} DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
