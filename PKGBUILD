# Maintainer: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Muhammad Qadri <Muhammad.A.Qadri at gmail dot com>

pkgname=voxforge-am-julius
pkgver=0.9.3
pkgrel=2
pkgdesc="Acoustic model information for use with Julius voice recognition software"
arch=('any')
url="http://www.voxforge.org/"
license=('GPL')
optdepends=('perl: for mkdfa.pl')
source=("${pkgname}-${pkgver}.tgz::http://www.repository.voxforge1.org/downloads/Main/Tags/Releases/${pkgver}/Julius-4.3.1-Quickstart-Linux_(${pkgver}).tgz")
install="${pkgname}.install"
changelog=ChangeLog
sha512sums=('3f3d8f7655e40657f330cde1f0b1cb2a8ae7425f14921f0a124d67b638c2f41101e9eaa2fc39cf2f157d413f8b0560ffb20ddbf9f8773beb5c518a508d65a5f1')

package() {
  cd "${srcdir}"

  install -Dm644 "Sample.jconf" "${pkgdir}/usr/share/voxforge/julius/julian.jconf"
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/grammar/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/grammar/" "grammar/"*
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/" "acoustic_model_files/"*
}

