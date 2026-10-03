# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp-bin
pkgver=0.7.4.4
pkgrel=1
pkgdesc="Multiple RTMP outputs plugin for OBS Studio (prebuilt binaries from upstream)"
arch=('x86_64')
url="https://github.com/sorayuki/obs-multi-rtmp"
license=('GPL-2.0-only')
depends=('obs-studio')
makedepends=('binutils')

provides=('obs-multi-rtmp')
conflicts=('obs-multi-rtmp' 'obs-multi-rtmp-git')

# The package author made a mistake in the package numbering. Therefore, I'm still numbering manually. I left it in case of a repeat mistake.
# source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-0.7.3.0-x86_64-linux-gnu.deb")
# source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-0.7.4.0-x86_64-linux-gnu-ubuntu-26.04.deb")
# source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-${pkgver}.0-x86_64-linux-gnu.deb")

source=("${pkgname}-${pkgver}.deb::${url}/releases/download/${pkgver}/obs-multi-rtmp-${pkgver}-x86_64-linux-gnu-ubuntu-26.04.deb")

sha512sums=('8255625f7b1fc27c4738604fa0eb9784d2fd6a0c30d915419d1cf064db63ac0be6d0c0c965cae9798a13625845d1bef38202df72ec06ec3645ec9d24a1b08bda')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.*
}

package() {
  cd "${pkgdir}"

  install -d usr/lib/obs-plugins
  install -d usr/share/obs/obs-plugins/obs-multi-rtmp

  cp -a "${srcdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/. usr/lib/obs-plugins/
  cp -a "${srcdir}"/usr/share/obs/obs-plugins/obs-multi-rtmp/. \
        usr/share/obs/obs-plugins/obs-multi-rtmp/
}
