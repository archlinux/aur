#Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
#Contributor: Anton Bazhenov <anton.bazhenov at gmail>
#Contributor: Fernando Henrique <arch at liquuid dot net>

pkgname=moonshiner
pkgver=1.0
pkgrel=4
pkgdesc="A graphical frontend for Ghostscript's PostScript-to-PDF converter"
arch=('any')
url="http://moonshiner.sourceforge.net/"
license=('GPL3')
depends=('pygtk' 'ghostscript' 'hicolor-icon-theme' 'gtk-update-icon-cache'
         'desktop-file-utils')
makedepends=("python2-distribute")
install="moonshiner.install"
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz
	moonshiner.desktop moonshiner.png)
md5sums=('fb3cfa1fda862dd48c49864df908f84f'
         '3371ee433a2dff83b1e3771234934eb8'
         '52ac50697c126c6addbb71d711cdf8c3')

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir"/ --optimize=1
  install -D -m644 "${srcdir}"/moonshiner.desktop \
    "${pkgdir}"/usr/share/applications/moonshiner.desktop
  install -D -m644 "${srcdir}"/moonshiner.png \
    "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/moonshiner.png
}

