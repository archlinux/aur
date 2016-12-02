# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=0.9.9
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim" "python2-qrcode" "python2-setuptools" "python2-cryptography" "python2-axolotl-git")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_0.16_zip/${_pkgname}.zip")
sha512sums=('cb0af63fb07e876a66cc68096934df2e1ce022ddb7b91f67bd7b793687936f1792cf3c62ca7a7d5e8dcc098fc72d56253505e80b793170f2b52b1a8a113b81dd')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING pkgs setup.cfg

  # Install the plugin
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
