# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.1.0
pkgrel=1
pkgdesc="The simplest way to keep notes."
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2' 'libnotify')
optdepends=()
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/Simplenote-linux-${pkgver}.deb")
sha256sums=('4189368f308f69225a2cdcf73b307d20502366155448852c5ffb5834fd6e6e05')


package() {
  cd ${srcdir}

  # extract the data part of the deb package
  tar xzfp data.tar.gz -C ${pkgdir}

  # simlink executable to /usr/bin
  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
