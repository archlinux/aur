# Maintainer: Matthew Hague <matthewhague@zoho.com>
# Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=libvc-git
pkgver=1
pkgrel=1
pkgdesc="vCard library, part of rolo project."
arch=('i686' 'x86_64')
url="https://github.com/yourealwaysbe/libvc"
license=("LGPL")
depends=('glibc')
makedepends=('flex' 'git' 'autoconf')
conflicts=(libvc)
provides=(libvc)
source=(git://github.com/yourealwaysbe/libvc.git)
md5sums=('SKIP')

build() {
  cd ${srcdir}/libvc
  autoreconf -f -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/libvc
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name '*.la' -exec rm {} \;
}

