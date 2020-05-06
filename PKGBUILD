# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=tkimg
_pkgname=Img
pkgver=1.4.11
pkgrel=1
pkgdesc='Provides the handling of several image formats beyond the standard formats in Tk'
url='https://wiki.tcl-lang.org/page/Img'
arch=('x86_64')
license=('custom')
depends=('zlib' 'libjpeg' 'libpng' 'libtiff' 'tcl' 'tk' 'tcllib')
source=("https://downloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}-Source.tar.gz")
sha256sums=('a6b297950f701ec62b4931649ca5feb205d14d08020fe366d6cf69f0e7e05f88')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure --prefix=/usr --enable-64bit --enable-threads
  make all
}

package() {
  cd "${_pkgname}-${pkgver}"

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
