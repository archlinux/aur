# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=tkimg
_pkgname=Img
pkgver=1.4.15
pkgrel=1
pkgdesc='Provides the handling of several image formats beyond the standard formats in Tk'
url='https://wiki.tcl-lang.org/page/Img'
arch=('x86_64')
license=('custom')
depends=('zlib' 'libjpeg' 'libpng' 'libtiff' 'tcl' 'tk' 'tcllib')
source=("https://downloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}-Source.tar.gz")
sha256sums=('2bd8615ee87197aca48dc7bfeef0749aac5c8c56ac499def94cc5a4700a59d73')

build() {
  cd "${_pkgname}-${pkgver}-Source"

  ./configure --prefix=/usr --enable-64bit --enable-threads
  make all
}

package() {
  cd "${_pkgname}-${pkgver}-Source"

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
