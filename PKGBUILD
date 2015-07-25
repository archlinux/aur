# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Jacob Alexander <triplehaata@gmail.com>
# Based on the QL-500 PKGBUILD -> K. Hampf <khampf@users.sourceforge.net>
pkgname=brother-ql700-cupswrapper
_pkgname=ql700cupswrapper
pkgver=1.0.2
pkgrel=1
_brotherrel=0
pkgdesc="LPR-to-CUPS wrapper for Brother P-Touch QL-700 labelprinter (metric)"
url="http://solutions.brother.com/linux/en_us/"
arch=('i686' 'x86_64')
license=("GPL2")
if [ $CARCH == "x86_64" ]; then
  depends=('cups' 'ghostscript' 'lib32-glibc' 'brother-ql700-lpr')
else
  depends=('cups' 'ghostscript' 'glibc' 'brother-ql700-lpr')
fi
makedepends=('rpmextract' 'cpio')
source=("http://download.brother.com/welcome/dlfp002193/ql700cupswrapper-$pkgver-$_brotherrel.i386.rpm")
md5sums=('9315769e988fbb2088a3ec1875d2189f')
noextract=("$_pkgname-$pkgver-$_brotherrel.i386.rpm")
install='brother-ql700-cupswrapper.install'

build() {
        cd $srcdir
        rpmextract.sh "$_pkgname-$pkgver-$_brotherrel.i386.rpm"

        rm -f $_pkgname-$pkgver-$_brotherrel.i386.rpm
}

package() {
	mv opt $pkgdir/. || return 1
}
