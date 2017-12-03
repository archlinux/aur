# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Edgard Castro <castro@edgard.org>
# Contributor: James An <james@jamesan.ca>
# Contributor: Helge Willum Larsen <helgesdk@gmail.com>
# Contributor: Ng Oon-Ee <ngoonee.talk@gmail.com>
# Contributor: Byron Clark <byron@theclarkfamily.name> (auto-disper-git)
# Contributor: phillipberndt (maintainer of the current autorandr)
# Contributor: wertarbyte (original author of auto-disper and autorandr)

pkgname=autorandr
pkgver=1.3
pkgrel=1
pkgdesc="Auto-detect the connected display hardware and load the appropiate X11 setup using xrandr."
arch=('any')
url="https://github.com/phillipberndt/${pkgname}"
license=('GPL3')
depends=('python' 'xorg-xrandr')
optdepends=(
  "xorg-xdpyinfo: For detecting the primary XRandR output"
)
provides=("${pkgname%-git}")
conflicts=(
  "${pkgname}-git"
  "auto-disper-git"
  "autorandr-asch-git"
  "autorandr-phillipberndt-git"
)
install="${pkgname}.install"
source=(
  "https://github.com/phillipberndt/${pkgname}/archive/${pkgver}.tar.gz"
  "${pkgname}.install"
)
sha512sums=('19419d8c180ca55ffd97f93bf9f90fc14923fe93b0a98b5b1e5aa75bf01f74b3c816b51fe97a8f38eeb134bda0f19bf3281ee724a1c3339e762fcbca305cc08c'
            '501a110f9c3a0b56fc7036198ce773e4ea2035951bbf94f703b8671ff5c62bd88e6d747b2002f68982c569ec5f19e459572880bdde24c6b984566f33a589527e')

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" PREFIX=/usr install
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
