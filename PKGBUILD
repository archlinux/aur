# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.6.24
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim>=1.0.99" "gajim<=1.1.90" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('f38c9d542d3e1a4f6ff74590e58fbc2733e580bcceb0a27015e106193f5703b0869b23582d8c3dd098a905e8973dee5d8caf61cce6f769b0e7f5b23317d34167')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.7/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.7/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
