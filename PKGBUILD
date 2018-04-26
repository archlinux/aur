# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.5.11
pkgrel=1
pkgdesc="Gajim plugin for OMEMO Multi-End Message and Object Encryption."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin"
license=('GPL')
depends=("gajim>=1.0.0" "python-qrcode" "python-setuptools" "python-cryptography" "python-axolotl")
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('19061340f02819a5885561d7e203daa1916c04e008d2798745ed66254e31753ab13f59e2ccacf26e30b580f92f75e234d31ef3eb802e8923a9fb8133088ea666')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
