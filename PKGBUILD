# Maintainer: Bjoern Franke <bjo+aur at schafweide.org>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.8.17
pkgrel=1
_pythonversion=3.10
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.5' 'gajim<=1.5.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins/master/${_pkgname}/${_pkgname}_${pkgver}.zip")
sha512sums=('b3206865d5e9e5c44fe6b798992c2a8ca39c6920d7836d3c39cfd53ca6c0ba329ce4b494340c12e2cf5ca24f2fa8cacbb510f4a664bb588f7d3f6ff5e053172b')

package() {
  cd "${srcdir}"


  # Install the plugin
  install -d "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
