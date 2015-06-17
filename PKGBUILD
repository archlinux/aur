# Maintainer: Oozyslug <oozyslug@gmail.com>
# Contributor: Anntoin Wilkinson <anntoin@gmail.com>

pkgname=nix
pkgver=1.9
pkgrel=1
pkgdesc="A purely functional package manager"
url="http://nixos.org/"
arch=('i686' 'x86_64')
license=('LGPL')
depends=('perl-www-curl' 'perl-dbd-sqlite' 'perl-dbi')
makedepends=('bzip2' 'gc' 'openssl')
source=(http://nixos.org/releases/${pkgname}/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.xz)
sha256sums=('8a47cd7c35dfa628a4acfaef387e7451013c61d250bbcf1f38067a7c73f9f3e1')

build() {
    cd ${srcdir}/${pkgname}-${pkgver}
    ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname} --sysconfdir=/etc --enable-gc
    make
}

package() {
    cd ${srcdir}/${pkgname}-${pkgver}
    make DESTDIR=${pkgdir} install
}
