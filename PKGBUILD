# Maintainer: Christoph Bayer <chrbayer@criby.de>

pkgname=mod_authn_otp
pkgver=1.1.7
pkgrel=1
pkgdesc='Apache module for one time password authentication'
arch=('i686' 'x86_64')
url='http://code.google.com/p/mod-authn-otp/'
license=('Apache')
depends=('openssl')
makedepends=('apache')
source=("https://s3.amazonaws.com/archie-public/mod-authn-otp/${pkgname}-${pkgver}.tar.gz")
md5sums=('0f21b3a3a52da371151d92ae51dfb750')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure
  make || return 1
  mkdir -p "${pkgdir}/usr/lib/httpd/modules/"
  make DESTDIR="${pkgdir}" install
}
