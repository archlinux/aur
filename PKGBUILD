# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Anntoin Wilkinson <anntoin gmail com>
# Contributor: Iñigo Alvarez<alvarezviu@gmail.com>

pkgname=rodent
pkgver=5.3.16.0
pkgrel=1
pkgdesc="Lightweight, yet full of options filemanager, compatible with console commands"
arch=('i686' 'x86_64')
url="http://xffm.org/"
license=('GPL3')
makedepends=('pkg-config' 'intltool' 'librsvg')
depends=('librfm5' 'desktop-file-utils')
optdepends=('python2: for rfm-simple-agent')
install=$pkgname.install
source=(http://downloads.sourceforge.net/project/xffm/$pkgver/$pkgname-$pkgver.tar.bz2)
md5sums=('12e12dbe475ae3847ffb05246c9e191a')

build()
{
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr #--disable-applications
    make
}

check () {
    cd "$pkgname-$pkgver"
    make check
}

package()
{
    cd "$pkgname-$pkgver"
    make DESTDIR="${pkgdir}" install
}
