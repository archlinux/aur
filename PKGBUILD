# Maintainer: Sapphira Armageddos <shadowkyogre.public@gmail.com>
pkgname=gpw
pkgver=1
pkgrel=2
pkgdesc="Generate pronouncable passwords"
arch=('i686' 'x86_64')
url="http://www.multicians.org/thvv/tvvtools.html#gpw"
license=('custom')
makedepends=('words')
source=("ftp://ftp.multicians.org/gpw.C"
"ftp://ftp.multicians.org/loadtris.C"
"ftp://ftp.multicians.org/gpw.Makefile"
"LICENSE.gpw")

prepare() {
	cd "$srcdir"
	# make sure there's no type conversion errors
	sed -e 's/const short/const int/g' -i loadtris.C
}

build() {
	cd "$srcdir"
	make -f gpw.Makefile
}

package() {
	cd "$srcdir"
	install -Dm755 gpw "$pkgdir/usr/bin/gpw"
	install -Dm755 LICENSE.gpw "$pkgdir/usr/share/licenses/gpw/LICENSE"
}

sha256sums=('ef7a588f9d2845d3ef5a2e183dbc53aa3dc0ce42d37c7f75c6cf4b4154e6b32b'
            '62cff3cadfa1b5db9adede9a89c0667066891298e66ca975b98eb531cf9290cc'
            'a4de0fba1ea3cc06f5657885990bb4d700a1fbeddbb83d195eb4ab8a7245b10e'
            'ef28be28bfe05697caccee512518d60d4f775c17b23ace41726bf958635be17f')
