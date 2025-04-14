# Maintainer:Bipin Kumar <kbipinkumar@pm.me>
# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=cimfomfa
pkgver=22.273
_pkgver=${pkgver//./-}
pkgrel=5
pkgdesc='C utility library for zoem programming language' 
arch=(x86_64)
url="http://micans.org/mcl/"
license=('GPL-2.0-only')
depends=('glibc')
provides=('libtingea.a' 'libtingea.so')
source=("${pkgname}-${_pkgver}.tar.gz::http://micans.org/mcl/src/${pkgname}-${_pkgver}.tar.gz")
b2sums=('9b5d0d293add36485983d79c794c487f8946102b7f1ad0a316f49cd0b254182f8c38df1dc0344987f8ee3ecea827ccc9ba87cd31a6a6fe2935cc072ee88f0288')


build() {
  cd ${pkgname}-${_pkgver}
  ./configure --prefix=/usr
  make 
}

package() {
  cd ${pkgname}-${_pkgver}
  install -d 755 ${pkgdir}/usr
  make DESTDIR=${pkgdir}/ install
}
