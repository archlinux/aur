# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

pkgname=firefox-os-simulator
_pkgname=firefox_os_simulator
pkgver=4.0.2
pkgrel=1
pkgdesc="Firefox OS simulator"
arch=('any')
url="https://addons.mozilla.org/en-US/firefox/addon/firefox-os-simulator/"
license=('MPL')
depends=('firefox')
options=(!strip)
source=("https://addons.mozilla.org/firefox/downloads/file/219110/$_pkgname-${pkgver}-fx-linux.xpi")

package() {
  cd ${srcdir}

  extension_id=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)
  installdir="${pkgdir}/usr/lib/firefox/extensions/$extension_id"

  install -dm755 ${installdir}
  cp -a * ${installdir}
  rm ${installdir}/${_pkgname}-$pkgver-fx-linux.xpi
}

md5sums=('7db32bf2fcb11e656579bdb628065fb6')
