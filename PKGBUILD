# Maintainer: Bjoern Franke <bjo+aur at schafweide.org>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.7.13
pkgrel=1
_pythonversion=3.9
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.2.91' 'gajim<=1.3.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('33f7d1132ed9e218e17c8288ad2586b1a9c6d547db93b5b9bb97abcb8df2541bba35d9cc3fcef74d13b35353636cb4ef652805d69eda878d361b029e62fd9ee2')

package() {
  cd "${srcdir}/${_pkgname}"

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
