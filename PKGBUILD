# $Id: PKGBUILD 194783 2016-11-06 20:14:07Z foutrelis $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: Judd <jvinet@zeroflux.org>

pkgname=sqlite2
pkgver=2.8.17
pkgrel=8
pkgdesc="A C library that implements an SQL database engine"
arch=('i686' 'x86_64')
url="http://www.sqlite.org/"
depends=('readline>=6.0.00')
source=("http://www.sqlite.org/sqlite-$pkgver.tar.gz" 
        'LICENSE')
license=('custom')
md5sums=('838dbac20b56d2c4292e98848505a05b'
         '5d3b333e59a37747284f66081660f8a1')

build() {
  cd ${srcdir}/sqlite-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/sqlite-${pkgver}

  make DESTDIR=${pkgdir} install

  # install custom license
  install -Dm644 ${srcdir}/LICENSE \
	${pkgdir}/usr/share/licenses/${pkgname}/LICENSE 
}
