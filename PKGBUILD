# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-gtk3
pkgver=2.3.7
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim-git" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo' 'gajim-plugin-omemo-git')
source=("https://dev.gajim.org/gajim/gajim-plugins/uploads/fc40aa3a214bb2c41aca743d2199f0f2/omemo_2.3.7.zip")
sha512sums=('e08661d32f7f27a1bc97ccec2dc0b69013e811fc371241b0c66e02f506a6bef7b623bdf3a505db26890fa31e7496b579cfa334c5bf491817765fc5c7e52ab508')

package() {
  cd ${srcdir}/omemo

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/share/gajim/plugins/omemo
  cp -r * ${pkgdir}/usr/share/gajim/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
