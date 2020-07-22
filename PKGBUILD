# Maintainer: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.6.80
pkgrel=1
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.1.99' 'gajim<=1.2.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('8d1ae1dfc02b04cd67bd695c41433d215cec17b09d29b21ff459d7ea73814783c4e78f6193683c2c12f456aaf408dfeb12a80348449dd24092224942f79d1589')

package() {
  cd "${srcdir}/${_pkgname}"

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d "${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python3.8/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
