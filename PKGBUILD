# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.6.79
pkgrel=1
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.1.99' 'gajim<=1.2.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('59cc3d264c011b11b3ae7f4714f34dafef2fbfa60ecefb8d5e777568083fcc1974a53fce1101d95bf478135961c13da0e467d8a561d8fe2cd8d0bf5b70627435')

package() {
  cd "${srcdir}/${_pkgname}"

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d "${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
