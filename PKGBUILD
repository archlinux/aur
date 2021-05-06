# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-flucoma
pkgver=1.5.0
pkgrel=1
altver_=TB2-beta01
pkgdesc="Fluid Corpus Manipulation plugins for Supercollider"
arch=('x86_64')
url="https://www.flucoma.org/"
license=('BSD')
groups=('pro-audio')
depends=('supercollider')
optdepends=()
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/flucoma/flucoma-sc/releases/download/${altver_}/FluCoMa-SC-Unix-beta01.zip")
md5sums=('074abe31fa0f1c6a4ed15342dfbb000d')

package() {

	# Install Supercollider files in system extension directory
	install -dm755 "${pkgdir}/usr/share/SuperCollider/Extensions/FluidCorpusManipulation"
	cd "$srcdir/FluidCorpusManipulation"
	cp -av {AudioFiles,Classes,Examples,HelpSource,plugins} "${pkgdir}/usr/share/SuperCollider/Extensions/FluidCorpusManipulation/"
	# License
	install -Dm644 "$srcdir/FluidCorpusManipulation/license.md" "$pkgdir/usr/share/licenses/$pkgname/license.md"

	# Docs
	install -vDm644 "$srcdir/FluidCorpusManipulation/QuickStart.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
