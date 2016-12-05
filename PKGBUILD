# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=1.0.0
pkgrel=2
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim" "python2-qrcode" "python2-setuptools" "python2-cryptography" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_0.16_zip/${_pkgname}.zip")
sha512sums=('9364d9d20c12975ee2c4a6b71ce3b1a010fdfe3f93a74f926272679190c59d1391e55eaa11bfc6f4b8eee0b56affca6785dad720d51d501b43aeff8be1bc291b')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING setup.cfg

  # Install the plugin
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
