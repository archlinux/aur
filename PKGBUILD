# Maintainer: Pascal Pascher < aur AT clouddrop DOT de >

pkgname=gajim-plugin-httpupload-gtk3
pkgver=0.7.1
pkgrel=1
pkgdesc="Gajim plugin to implement http uploads <XEP-0363>."
arch=(any)
url="https://dev.gajim.org/gajim/gajim-plugins/wikis/HttpUploadPlugin"
license=('GPL')
depends=("gajim-git")
optdepends=("python-cryptography")
provides=('gajim-plugin-httpupload')
conflicts=('gajim-plugin-httpupload')
source=("https://dev.gajim.org/gajim/gajim-plugins/repository/gtk3/archive.zip")
#sha512sums=('babce68e7d858c4b1373a10d852495016b32d610b96f36ff95932ad8cd75094ee613da51846cdb981552ab55993295eb0b5ac4bb9a3c45d07b6afa9cb7b27db8')
sha512sums=('SKIP') # upstream checksum changes without the content being any different

package() {
  cd ${srcdir}/gajim-plugins-gtk3-*

  # Remove unnecessary files
  find ./* -maxdepth 0 -not -name 'httpupload' -print0 | xargs -0 rm -rf --

  cd httpupload

  # Install the plugin
  install -d ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/httpupload
  cp -r * ${pkgdir}/usr/lib/python3.6/site-packages/gajim/data/plugins/httpupload/
}

# vim:set ts=2 sw=2 et:
