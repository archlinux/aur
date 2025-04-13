# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="A cli tool to change source for every software on every platform"
arch=('x86_64') # TODO: add more archs
url="https://github.com/RubyMetric/chsrc"
license=('GPL-3.0-or-later' 'MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"$url/releases/download/v$pkgver/chsrc-x64-linux"
	"https://raw.githubusercontent.com/RubyMetric/chsrc/v$pkgver/LICENSE-MIT.txt"
	"https://github.com/RubyMetric/chsrc/raw/v$pkgver/doc/chsrc.1"
	"https://github.com/RubyMetric/chsrc/raw/v$pkgver/doc/chsrc.texi"
)
noextract=()
sha256sums=('be5f43c0e9f7811da25db02859d390933ad166f04ac3d9cbc85744a5c94ea8ed'
            '2efd2d4e273714f8ed1483342abb5e204291a7916dddf15f7049fd18f95b2528'
            'bedb6fb145c3faaf161a7924a1a17a91678390ffd95907db9a500a90cff8410a'
            '0045f83c06026a648b78a40a16eab3ffdd47ac87324d0971a6e0636f5de7ffe4')
validpgpkeys=()

package() {
	install -Dm 755 chsrc-x64-linux $pkgdir/usr/bin/chsrc
	# MIT License
	install -Dm 644 LICENSE-MIT.txt -t $pkgdir/usr/share/licenses/$pkgname
	# Man Page
	install -Dm 644 chsrc.1 -t $pkgdir/usr/share/man/man1/
	# Texinfo
	makeinfo chsrc.texi --output=chsrc.info
	install -Dm 644 chsrc.info -t $pkgdir/usr/share/info/
}
