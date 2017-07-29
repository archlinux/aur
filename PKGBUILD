# Maintainer: Justin Dray <justin@dray.be>
# Contributor: David Roheim <david dot roheim at gmail dot com>
# Contributor: DrZaius <lou[at]fakeoutdoorsman[dot]com>

pkgname=vo-amrwbenc
pkgver=0.1.3
pkgrel=1
pkgdesc="VisualOn Adaptive Multi Rate Wideband (AMR-WB) encoder"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/opencore-amr/"
license=('APACHE')
depends=('glibc')
options=('!emptydirs' '!libtool')
source=(http://downloads.sourceforge.net/project/opencore-amr/vo-amrwbenc/${pkgname}-${pkgver}.tar.gz)
sha512sums=('5f132f798f00ec2c0619700ab1ce456897792b45631af4b538c866636af9c9de5600af5f79040c41c3dc69c17cf4be7032139a9518a46a4276431e091f3dd6a9')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
