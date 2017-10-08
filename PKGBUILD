# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-gtk3
pkgver=2.3.8
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim-git" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo' 'gajim-plugin-omemo-git')
source=("https://dev.gajim.org/gajim/gajim-plugins/uploads/f241700d59b16e3563d00b6e7851bbf3/omemo_2.3.8.zip")
sha512sums=('ef2446e474c27ee330239217f8617bb07c2af6080008b72b035b4df4b243e65b44d00ceb329d35be41ba9d34ce7248fd2f870a146df778110858bf66701546c8')

package() {
  cd ${srcdir}/omemo

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
