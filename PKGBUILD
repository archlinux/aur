# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
_pkgname=arch-test
pkgname=${_pkgname}-bin
pkgver=0.19
_debrel=1
pkgrel=2
epoch=
pkgdesc="detect architectures supported by your machine/kernel"
arch=('any')
url="https://github.com/kilobyte/arch-test/"
license=('MIT')
groups=()
depends=('bash' 'perl')
makedepends=()
checkdepends=()
optdepends=()
provides=('arch-test')
conflicts=('arch-test')
backup=()
options=(!strip)
install=
changelog=
source=("http://ftp.debian.org/debian/pool/main/a/arch-test/${_pkgname}_$pkgver-${_debrel}_all.deb")
noextract=()
md5sums=('28261cc07df4c119e916b7ae29a965e4')
validpgpkeys=()

prepare() {
	tar -xf data.tar.xz
}

package() {
	cp -a usr $pkgdir
	mkdir -p $pkgdir/usr/share/licenses/$pkgname
	mv $pkgdir/usr/share/doc/arch-test/copyright $pkgdir/usr/share/licenses/$pkgname
	rm -rf $pkgdir/usr/share/{doc,lintian}
}
