# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

_version=2.4.7-04
pkgname=mod_itk
pkgver=${_version//-/.r}
pkgrel=1
pkgdesc='Apache mpm itk module that allows you to run each of your vhost under a separate uid and gid'
arch=(x86_64)
url='http://mpm-itk.sesse.net/'
license=(APACHE)
depends=(apache)
source=(http://mpm-itk.sesse.net/mpm-itk-$_version.tar.gz)
sha256sums=('609f83e8995416c5491348e07139f26046a579db20cf8488ebf75d314668efcf')

build() {
  cd mpm-itk-$_version
  ./configure --prefix=/usr
  make
}

package() {
  cd mpm-itk-$_version
  install -D -m755 .libs/mpm_itk.so "$pkgdir/usr/lib/httpd/modules/mpm_itk.so"
}
