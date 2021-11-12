# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=supercollider-flucoma
pkgver=1.5.0
pkgrel=3
altver_=1.0.0-TB2.beta4
pkgdesc="Fluid Corpus Manipulation plugins for Supercollider"
arch=('x86_64')
url="https://www.flucoma.org/"
license=('BSD')
groups=('pro-audio' 'supercollider-plugins')
depends=('supercollider')
conflicts=('supercollider-flucoma-git')
optdepends=()
source=("$pkgname-$pkgver-$pkgrel.zip::https://github.com/flucoma/flucoma-sc/releases/download/${altver_}/FluCoMa-SC-Linux-beta4.zip")
md5sums=('0ed29d35d4b83cd39fbd184d20c368fa')

package() {

	# Install Supercollider files in system extension directory
	install -dm755 "${pkgdir}/usr/share/SuperCollider/Extensions/FluidCorpusManipulation"
	cd "$srcdir/FluidCorpusManipulation"
	cp -av {AudioFiles,Classes,Examples,HelpSource,plugins} "${pkgdir}/usr/share/SuperCollider/Extensions/FluidCorpusManipulation/"
	# License
	install -Dm644 "$srcdir/FluidCorpusManipulation/LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"

	# Docs
	install -vDm644 "$srcdir/FluidCorpusManipulation/QuickStart.md" -t "${pkgdir}/usr/share/doc/${pkgname}/"
}
