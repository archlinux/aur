# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.6.30
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim>=1.0.99" "gajim<=1.1.90" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('0badbff3088647caf5b1fef388ee10bc0d03ed4ca2450db8b865a2f12c7e13c2f4b6c8281db1f72f4954453428ec38342e289d3139f56d7333f9b4f600e42235')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
