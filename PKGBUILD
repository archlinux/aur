# Maintainer: FadeMind <fademind@gmail.com>

_plugin_name=mozilla_archive_format_with_mht_and_faithful_save
pkgname=firefox-extension-mozilla-archive-format
pkgver=3.1.0.1
pkgrel=1
pkgdesc="Opens and saves all the Web sites in a single file. It supports MHTML (MHT) and archives MAF based on ZIP archive system."
url='https://addons.mozilla.org/firefox/addon/mozilla-archive-format/'
arch=('any')
license=('MPL')
depends=('firefox')
source=("${_plugin_name}-${pkgver}.xpi::https://addons.mozilla.org/firefox/downloads/latest/212/addon-212-latest.xpi")
sha256sums=('f22181dc22a27e8c0605da8bb0803340ecaa1930f188edd31774dbef1cf4ecaa')

package() {
  cd ${srcdir}
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=${pkgdir}/usr/lib/firefox/browser/extensions/${emid}
  install -d ${dstdir}
  rm *.xpi
  mv * ${dstdir}
}
