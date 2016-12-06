# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.0.7
pkgrel=1
pkgdesc="The simplest way to keep notes."
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libnotify')
optdepends=()
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/${_pkgname}-${pkgver}.deb")
md5sums=('7ead835110aee9dd6d4b77faacf5b3d0')

package() {
  cd ${srcdir}

  # extract the data part of the deb package
  tar xzfp data.tar.gz -C ${pkgdir}

  # simlink executable to /usr/bin
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
