# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: Martin C. Doege <mdoege at compuserve dot com>
# Contributor: kotyz <kotyz.king@gmail.com>

pkgname=tkimg
_pkgname=Img-Source
pkgver=1.4.7
pkgrel=1
pkgdesc="This package enhances Tk, adding support for many other Image formats: BMP, XBM, XPM, GIF, PNG, JPEG, TIFF and postscript."
url="http://tkimg.sourceforge.net"
arch=('x86_64')
license=('custom')
depends=('zlib' 'libjpeg' 'libpng' 'libtiff' 'tcl' 'tk' 'tcllib')
source=(http://downloads.sourceforge.net/${pkgname}/${_pkgname}-${pkgver}.tar.gz)
sha256sums=('5e513e0913e1f36f6802abf60cf9b8bfd6810bcc4b5a27c340e53bb4d12ab2ee')

build() {
  cd ${_pkgname}-${pkgver}

  ./configure --prefix=/usr --enable-64bit --enable-threads
  make all
}

package() {
  cd ${_pkgname}-${pkgver}

  make INSTALL_ROOT="${pkgdir}" install
  install -Dm644 license.terms "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
