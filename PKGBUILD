# Maintainer: Christoph Bayer <chrbayer@criby.de>

pkgname=mod_authn_otp
pkgver=1.1.10
pkgrel=1
pkgdesc='Apache module for one time password authentication'
arch=('i686' 'x86_64')
url='https://github.com/archiecobbs/mod-authn-otp'
license=('Apache')
depends=('openssl')
makedepends=('apache')
source=("https://s3.amazonaws.com/archie-public/mod-authn-otp/${pkgname}-${pkgver}.tar.gz")
sha256sums=('043f305d26f33ef01b43136bce8f7814bdffd4627a36ab147da46b1852c5f3e7')

package() {
  cd $srcdir/${pkgname}-${pkgver}
  ./configure
  make || return 1
  mkdir -p "${pkgdir}/usr/lib/httpd/modules/"
  make DESTDIR="${pkgdir}" install
}
