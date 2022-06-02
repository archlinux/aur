# Maintainer: Bjoern Franke <bjo+aur at schafweide.org>
# Contributor: Tommaso Sardelli <lacapannadelloziotom AT gmail DOT com>

pkgname=gajim-plugin-omemo
_pkgname=omemo
pkgver=2.8.15
pkgrel=2
_pythonversion=3.10
pkgdesc='Gajim plugin for OMEMO Multi-End Message and Object Encryption.'
arch=(any)
url='https://dev.gajim.org/gajim/gajim-plugins/wikis/OmemoGajimPlugin'
license=('GPL')
depends=('gajim>=1.4' 'gajim<=1.4.90' 'python-qrcode' 'python-setuptools' 'python-cryptography' 'python-axolotl')
provides=('gajim-plugin-omemo')
conflicts=('gajim-plugin-omemo-git')
source=("https://ftp.gajim.org/plugins/master/${_pkgname}/${_pkgname}_${pkgver}.zip")
sha512sums=('5c3322239a149512f96b35359f0f423070f2e16f660885f62485306aaf6baeade564c8e5ab2fcfb63c1554dca8624c5d6fda5c0435c83aaafb484c98092fce48')

package() {
  cd "${srcdir}"


  # Install the plugin
  install -d "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}"
  cp -r * "${pkgdir}/usr/lib/python${_pythonversion}/site-packages/gajim/data/plugins/${_pkgname}/"
}

# vim:set ts=2 sw=2 et:
