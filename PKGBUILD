# Maintainer: Terrasse <terrasse@qq.com>
# Maintainer: ccmywish <ccmywish@qq.com>
pkgname=chsrc-bin
pkgver=0.2.3
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
sha256sums=('58b87996c890d3681acb3297f708234be7d7f503107e0b6fa8b3f419613f8ff9'
            '2efd2d4e273714f8ed1483342abb5e204291a7916dddf15f7049fd18f95b2528'
            'fe19ab39414ed66d554ed960a5dd2c4a735c203135b2212e1dd93055e99255f1'
            '96396c9aa25cb3cb8b3baf58e49b3de50a28aa85b8a00faef47e1647562ffeda')
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
