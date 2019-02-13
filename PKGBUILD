# Bjoern Franke <bjo@nord-west.org>

pkgname=gajim-plugin-urlimagepreview
_pkgname=url_image_preview
pkgver=2.3.33
pkgrel=1
pkgdesc="Gajim plugin which displays a preview of links to images"
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/urlimagepreviewplugin"
license=('GPL')
depends=("gajim>=1.1.91" "gajim<=1.2.90" "python-setuptools" "python-cryptography")
provides=('gajim-plugin-urlimagepreview')
source=("https://ftp.gajim.org/plugins_releases/${_pkgname}_${pkgver}.zip")
sha512sums=('e5a3e5d4d7b4e86ce087f9f85c355b96c7ceca2a3fb00dee5838263211b1b4d28b8d60db2407291435c9f6ea7ac42e808926aa389d0924182691b3ace6100a8d')

package() {
  cd ${srcdir}/${_pkgname}

  # Remove unnecessary files
  rm -r CHANGELOG COPYING

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.7/site-packages/gajim/data/plugins/${_pkgname}
  cp -r * ${pkgdir}/usr/lib/python3.7/site-packages/gajim/data/plugins/${_pkgname}/
}

# vim:set ts=2 sw=2 et:
