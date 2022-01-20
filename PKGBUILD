# Maintainer: Viktor Drobot (aka dviktor) linux776 [at] gmail [dot] com

pkgname=vim-dbext
pkgver=26.00
pkgrel=1
pkgdesc="Provides database access to many DBMS (Oracle, Sybase, Microsoft, MySQL, DBI,..)"
url="https://www.vim.org/scripts/script.php?script_id=356"
arch=(any)
license=(GPL2)
depends=('vim>=8.0')
makedepends=(unzip)
groups=(vim-plugins)
source=("${pkgname}-${pkgver}.zip::https://www.vim.org/scripts/download_script.php?src_id=25648")
noextract=("${pkgname}-${pkgver}.zip")
sha256sums=('71d3d0c721b0e8fcb9d50e3addb542842e9c3bc3a7192402224255de2fa3af5a')

prepare() {
  cd "${srcdir}"

  unzip -d "${pkgname}-${pkgver}" "${pkgname}-${pkgver}.zip"
}

package() {
  cd "${pkgname}-${pkgver}"

  local _installpath="${pkgdir}/usr/share/vim/vimfiles"

  install -d "${_installpath}"
  cp -r -t "${_installpath}" autoload doc plugin
}
