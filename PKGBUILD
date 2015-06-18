# Contributor: damir <damir@archlinux.org>
#Maintainer: Nathan Owe <ndowens.aur at gmail.com>
pkgname=clusterit
pkgver=2.5
pkgrel=3
pkgdesc="Tools to make a cluster of computers"
arch=('i686' 'x86_64')
license=('BSD')
url="http://www.sourceforge.net/projects/clusterit"
depends=('libx11' 'sh')
conflicts=('synce-librapi')
source=(http://downloads.sourceforge.net/clusterit/${pkgname}-${pkgver}.tar.gz 'LICENSE')
md5sums=('f0e772e07122e388de629fb57f7237ab'\
         '49524975a324d7bcc9589fc5f95f5c3c')

build() {

  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  install -d ${pkgdir}/usr/share/licenses/${pkgname}
  make
  make DESTDIR=${pkgdir}/ INSTALL=/bin/install install
  install -Dm644 ${srcdir}/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
  }

