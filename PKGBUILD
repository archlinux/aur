# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output-bin
pkgver=1.0.8
pkgrel=3
pkgdesc="OBS Studio plugin: Branch Output filter"
arch=('x86_64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio>=30.1.0')
conflicts=('obs-branch-output')

source=("https://github.com/OPENSPHERE-Inc/branch-output/releases/download/${pkgver}/osi-branch-output-${pkgver}-x86_64-linux-gnu.deb")
sha512sums=('de378f1865cd4618f70df4ebbf07751ca83fad1aef3814f8031a866c323e487fbcb215be4434ad6ebfa8e7896e8fa2a35b21cedf0bcf5e0a685879e473593e31')

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
