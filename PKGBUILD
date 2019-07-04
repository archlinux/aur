# Maintainer: Kristian Gunstone <kristian.gunstone.butnotthispart@pean.northis.org>
# Contributor: Hugo Arpin ("harpin")
# Contributor: Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.2.0
pkgrel=1
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program. " 
arch=('i686' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license=('GPL')
depends=('zlib' 'libusb-compat')
optdepends=('libieee1284: libcd64 enhancements')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz)
sha256sums=('5727e0be9ee878bba84d204135a7ca25662db6b56fee6895301e50c1bdda70af')

srcroot="${pkgname}-${pkgver}-src/"

build() 
{
    cd "${srcroot}/src"
    ./configure --prefix=/usr --with-libusb --with-libcd64
    make
}

package() 
{
    cd ${pkgname}-${pkgver}-src/src

    install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
    install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
