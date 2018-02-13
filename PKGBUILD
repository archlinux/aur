# Maintainer: Samuel Walladge <samuel at swalladge dot id dot au>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>

pkgname=simplenote-electron-bin
_pkgname=simplenote
pkgver=1.1.3
pkgrel=1
pkgdesc="The simplest way to keep notes"
arch=('x86_64')
url="https://github.com/Automattic/simplenote-electron"
license=('GPL2')
depends=('gcc-libs' 'gconf' 'alsa-lib' 'nss' 'libxtst' 'gtk2')
provides=('simplenote')
source=("https://github.com/Automattic/simplenote-electron/releases/download/v${pkgver}/Simplenote-linux-${pkgver}.deb")
sha256sums=('a26f0515922c71dcda289ec47b07b129e35748d677410a17d89d21e6e846cba7')

package() {
  bsdtar -xv -C "${pkgdir}" -f "${srcdir}/data.tar.gz"

  mkdir -p ${pkgdir}/usr/bin/
  ln -s /usr/share/${_pkgname}/${_pkgname} ${pkgdir}/usr/bin/${_pkgname}
}
