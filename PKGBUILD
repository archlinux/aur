# Maintainer: Alexey D. <lq07829icatm@rambler.ru>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Mantas M. <grawity@gmail.com>
pkgname="nss-myhostname-separate"
_realname="nss-myhostname"
pkgver=0.3
pkgrel=1
pkgdesc="NSS plugin providing host name resolution for the locally configured system hostname"
arch=(i686 x86_64)
url="http://0pointer.de/lennart/projects/nss-myhostname/"
license=('LGPL2.1')
depends=('glibc')
provides=("nss-myhostname=${pkgver}")
conflicts=('nss-myhostname')
replaces=('nss-myhostname')
source=("http://0pointer.de/lennart/projects/${_realname}/${_realname}-${pkgver}.tar.gz")
md5sums=('d4ab9ac36c053ab8fb836db1cbd4a48f')

build() {
  cd "${srcdir}/${_realname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --disable-lynx
  make
}

package() {
  cd "$srcdir/${_realname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

