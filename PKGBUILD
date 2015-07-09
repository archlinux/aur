# prokit can install a ProteanOS system, run a ProteanOS shell and other
# commands, manage software packages in an installed ProteanOS system, and
# build packages for ProteanOS (with build dependencies automatically
# installed and removed).
#
# prokit is similar in function to the debootstrap, pbuilder, and sbuild
# programs of Debian and derivatives.

# First Linux Arch packager: Serge Victor <arch@random.re>


pkgname=prokit
pkgver=1.1.0
pkgrel=1
pkgdesc="The ProteanOS Development Kit"
arch=('any')
url="http://proteanos.com/dev/prokit/"
license=('GPL3')
depends=('bash')
source=('http://files.proteanos.com/pub/prokit/1.1.0/prokit-1.1.0.tar.bz2')
md5sums=('afbe178da9a6e8431e45d18b97b801c6')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./autogen.sh
    ./configure --prefix=/usr
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
