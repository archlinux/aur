# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-gtk3
pkgver=2.5.5
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim-git" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo' 'gajim-plugin-omemo-git')
source=("https://dev.gajim.org/gajim/gajim-plugins/uploads/d0ef151c0842360ae33b519e50eb9e71/omemo_2.5.5.zip")
sha512sums=('1f3d4272412faefd466bde8abdad9d0f09acf0e07998bbe1279735039b79590c9ed5b52a67c26a010eda1ed0ee11a2aad8b82579a773bce2ff2d1019f14bfc12')

package() {
  cd ${srcdir}/omemo

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
