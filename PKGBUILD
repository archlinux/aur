# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output-bin
pkgver=1.0.9
pkgrel=1
pkgdesc="OBS Studio plugin: Branch Output filter"
arch=('x86_64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio>=30.1.0')
conflicts=('obs-branch-output')

source=("https://github.com/OPENSPHERE-Inc/branch-output/releases/download/${pkgver}/osi-branch-output-${pkgver}-x86_64-linux-gnu.deb")
sha512sums=('7198b59fa907105d9b895803f8b03b5a675b3fbfa3998731054da8e05735498476571b8ee6636e676e0ca385f32edbec49211a47422fc7c346f94bf57c5e6299')

prepare() {
  cd "${srcdir}"
  bsdtar -xf data.tar.*
}

package() {
  cd "${pkgdir}"

  install -d usr/lib/obs-plugins
  install -d usr/share/obs/obs-plugins/obs-branch-output

  cp -a "${srcdir}"/usr/lib/x86_64-linux-gnu/obs-plugins/. usr/lib/obs-plugins/
  cp -a "${srcdir}"/usr/share/obs/obs-plugins/osi-branch-output/. \
        usr/share/obs/obs-plugins/obs-branch-output/
}
