# Maintainer: Bjoern Franke <bjo+aur at schafweide.org>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.7.15
pkgrel=1
_pythonversion=3.10
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.2.91' 'gajim<=1.3.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('b85a5928ee5c5fd844c9ec09ca16b74548e0d0e85b337df5b1282de7da62fa0ec4439fddc38e065390232a38d7c6e23aee49a40c2d18e1370d40918defcea998')

package() {
  cd "${srcdir}/${_pkgname}"

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
