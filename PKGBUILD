# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=1.0.3
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim" "python2-qrcode" "python2-setuptools" "python2-cryptography" "python2-axolotl-git" "python2-future")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("${_pkgname}-${pkgver}.zip::https://ftp.gajim.org/plugins_0.16_zip/${_pkgname}.zip")
sha512sums=(SKIP)

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING setup.cfg

  # Install the plugin
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
