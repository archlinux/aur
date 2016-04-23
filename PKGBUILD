# Maintainer: Bernhard Landauer <oberon@manjaro.org>

pkgname=xfpanel-switch
pkgver=1.0.4
pkgrel=1
pkgdesc="Simple application to manage Xfce panel layouts"
arch=('any')
url="https://launchpad.net/xfpanel-switch"
license=('GPL3')
depends=('python'
	'python-gobject')
makedepends=('intltool')
install=${pkgname}.install
source=("https://launchpad.net/{$pkgname}/${pkgver%.*}/${pkgver}/+download/${pkgname}-${pkgver}.tar.bz2")
md5sums=('007eeb979dccaf80769d1a756fac562c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --python=python
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make install DESTDIR=${pkgdir}
}
