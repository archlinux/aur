# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo-gtk3
pkgver=2.4.1
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim-git" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo' 'gajim-plugin-omemo-git')
source=("https://dev.gajim.org/gajim/gajim-plugins/uploads/4999d67c890eda9c94f477cbfc98e0e3/omemo_2.4.1.zip")
sha512sums=('a71f13b1e56759088c6e8d8d726137a9453f2dfbacd2cf03dc44ac20ec71ca4d5a1f3ce374d5e06f70f53703d69438068727e788d45ec04935aba5633f74a5fe')

package() {
  cd ${srcdir}/omemo

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
