# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Evgeniy Alekseev <arcanis at archlinux dot org>
# Contributor: Matt Harrison <matt at mistbyte dot com>
# Contributor: Muhammad Qadri <Muhammad.A.Qadri at gmail dot com>

pkgname=voxforge-am-julius
pkgver=4.3.1
pkgrel=1
pkgdesc='Acoustic model information for use with Julius voice recognition software'
arch=('any')
url='http://www.voxforge.org'
license=('GPL-3.0-or-later')
optdepends=('perl: For mkdfa.pl')
source=("${pkgname}-${pkgver}.tgz::http://www.repository.voxforge1.org/downloads/Main/Tags/Releases/0.9.0/Julius-4.3.1-Quickstart-Linux_(0.9.0).tgz"
        "${pkgname}.install")
install="${pkgname}.install"
sha256sums=('94ee7abe6b00d0224b2a03258fbd796de251a260b9bf2932026e9fcf5450e60a'
            '3768e92700adb16e32021fb10fb6ea65afad65fd662b188d225bd80e559981f5')

package() {
  cd "${srcdir}/julius-${pkgver}-quickstart-linux"

  install -Dm644 "Sample.jconf" "${pkgdir}/usr/share/voxforge/julius/julian.jconf"
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/grammar/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/grammar/" "grammar/"*
  install -dm755 "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/"
  install -m644 -t "${pkgdir}/usr/share/voxforge/julius/acoustic_model_files/" "acoustic_model_files/"*
}
