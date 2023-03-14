# Maintainer: Bjoern Franke <bjo+aur at schafweide.org>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.9.0
pkgrel=2
_pythonversion=3.10
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.6' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins/master/${_pkgname}/${_pkgname}_${pkgver}.zip")
sha512sums=('c17140f3a15167d6e8c0dd5de3af6888c21a8e06c114daede3010e611ca50fe210cef9f1eadd8c869b641d852ce123cd8bab4d74de5ed4034325cb5eb821514a')

package() {
  cd "${srcdir}"


  # Install the plugin
  install -d "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
