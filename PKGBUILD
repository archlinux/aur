# Maintainer: Konstantin Liberty <jon9097 at gmail dot com>

pkgname=obs-branch-output-bin
pkgver=1.0.13
pkgrel=1
pkgdesc="OBS Studio plugin: Branch Output filter"
arch=('x86_64')
url="https://github.com/OPENSPHERE-Inc/branch-output"
license=('GPL-2.0-only')
depends=('obs-studio>=30.1.0')
conflicts=('obs-branch-output')

source=("https://github.com/OPENSPHERE-Inc/branch-output/releases/download/${pkgver}/osi-branch-output-${pkgver}-x86_64-linux-gnu.deb")
sha512sums=('f2a36c35dccd3c92eab49471130a60b14683820a9cd3e4637a3560b96861191e89fc64122e1fc3ccc44c0e1a071ed8c04d97342f7ba6e4a0d91069642c8aeacc')

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
