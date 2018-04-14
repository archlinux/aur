# Contributor: Darren Wu <$(base64 --decode <<<ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==)>
# Maintainer: Darren Wu <$(base64 --decode <<<ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==)>

pkgname="gcc6-gcccompat"
pkgver="1.0"
pkgrel="1"
pkgdesc="Provide links for gcc6 without '-6' suffix"
arch=('x86_64')
url="none"
license=('MIT')
depends=('gcc6')
provides=('gcc')
conflicts=('gcc')

package() {
	mkdir -p $pkgdir/usr/bin
	pushd $pkgdir/usr/bin
	for LINK_NAME in \
		c++ \
		c89 \
		c99 \
		cc \
		collect-ld \
		collect2 \
		cpp \
		g++ \
		gcc \
		gcc-ar \
		gcc-nm \
		gcc-ranlib \
		gcov \
		gcov-dump \
		gcov-tool \
		lto1 \
		x86_64-pc-linux-gnu-c++ \
		x86_64-pc-linux-gnu-gcc \
		x86_64-pc-linux-gnu-gcc-ar \
		x86_64-pc-linux-gnu-gcc-nm \
		x86_64-pc-linux-gnu-gcc-ranlib \
	; do
		ln -s $LINK_NAME-6 $LINK_NAME
	done
	popd
}
