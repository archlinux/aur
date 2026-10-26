# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-multi-rtmp-bin
pkgver=0.7.4.5
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

sha512sums=('0eea020e652798a9028bf140881d32efa01cf99f524dbeeda7f0367fbd6bbc3a3e913de0a4469cfac9c6f523347c00a258657c1aad70b2419c2d8f082527f693')

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
