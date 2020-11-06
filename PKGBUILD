# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=flucoma-supercollider
pkgver=1.0.0
pkgrel=1
pkgdesc="Fluid Corpus Manipulation plugins for Supercollider"
arch=('x86_64')
url="https://www.flucoma.org/"
license=('BSD')
groups=('pro-audio')
depends=('supercollider')
optdepends=()
source=("https://github.com/flucoma/flucoma-sc/releases/download/${pkgver}-RC1/FluidCorpusManipulation_Supercollider_Linux_$(echo $pkgver | sed 's/\./_/g')-RC1.tar.gz")
md5sums=('01884700d6f88bdc46faccc062fe4b07')

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
