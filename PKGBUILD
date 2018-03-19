# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
pkgver=2.5.7
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim>=1.0.0" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://dev.gajim.org/gajim/gajim-plugins/uploads/526ddcc19517df6c6122d502867c7747/omemo_2.5.7.zip")
sha512sums=('940599121fbbcd0077310ba693539b3134465c9f3b0c6dff892735ab3a0763aa9afb1d78b8f4f0a732840ae7aabd233bd56379b53885325fe6c181ead6f855aa')

package() {
  cd ${srcdir}/omemo

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/omemo/
}

# vim:set ts=2 sw=2 et:
