# Maintainer: ValHue <vhuelamo_at_gmail_dot_com>
# Contributor: Cesar Alcalde <lambda512_at_gmail.com>
#
pkgname="gimp-plugin-saveforweb"
pkgver=0.29.3
pkgrel=3
pkgdesc="Plugin to save optimized images for display on web pages"
url="http://registry.gimp.org/node/33"
arch=('i686' 'x86_64')
license=('GPL')
provides=("${pkgname}")
depends=('gimp>=2.3')
makedepends=('perl-xml-parser' 'intltool' 'gettext')
source=("gimp-save-for-web-0.29.3.tar.bz2")
sha256sums=('b8462f59c6f416090bbf965631657674589e759b71b85ba4d196d79a494d1d27')

build() {
    cd "gimp-save-for-web-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "gimp-save-for-web-${pkgver}"
    make DESTDIR=${pkgdir} install
}

# vim: set ts=4 sw=4 et syn=sh ft=sh:
