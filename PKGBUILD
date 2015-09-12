# Maintainer: Charles Bos <charlesbos1 AT gmail>
# Contributor: martadinata666 <martadinata666@gmail.com>
# Contributor: WAntilles <wantilles@adslgr.com>

pkgname=compiz-fusion-plugins-unsupported
pkgver=0.8.10
pkgrel=2
pkgdesc="Compiz Fusion Unsupported plugins,provide effects like snow and fish"
arch=('i686' 'x86_64')
url="http://www.northfield.ws/projects/compiz/"
license=('GPL')
depends=("compiz-core>=${pkgver}" "compiz-bcop>=${pkgver}" "compiz-fusion-plugins-main>=${pkgver}" 'libnotify' 'mesa')
makedepends=('intltool' 'pkgconfig' 'gettext')
source=(http://www.northfield.ws/projects/compiz/releases/${pkgver}/plugins-unsupported.tar.gz)
sha256sums=('9ba0c1cfd06a19733f711302d5daf1e76d9e2d17b799a5f4a6f6eb13b99fac32')
options=(!libtool)

build() {
  cd ${srcdir}/plugins-unsupported
  ./autogen.sh --prefix=/usr
  make
}

package()
{
  cd "${srcdir}/plugins-unsupported"
  make DESTDIR=${pkgdir} install
}
