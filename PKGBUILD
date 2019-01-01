# Contributor: Michael Goehler <somebody dot here at gmx dot de>
# Contributor: Timothy Redaelli <timothy dot redaelli at gmail dot com>
# Contributor: DonVla <donvla at users dot sourceforge dot net>

pkgname=python2-smbus
pkgver=4.1
pkgrel=1
pkgdesc="Python wrapper for SMBus access over i2c-dev."
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/about/"
license=('GPL')
depends=('python2' 'i2c-tools')
options=('!strip')
source=("https://mirrors.edge.kernel.org/pub/software/utils/i2c-tools/i2c-tools-${pkgver}.tar.gz")
sha256sums=('ef8f77afc70e7dbfd1171bfeae87a8a7f10074829370ce8d9ccd585a014e0073')

build() {
  cd "${srcdir}/i2c-tools-${pkgver}/py-smbus"
  python2 setup.py clean --all
  python2 setup.py build
}

package() {
  cd "${srcdir}/i2c-tools-${pkgver}/py-smbus"
  python2 setup.py install --prefix "${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
