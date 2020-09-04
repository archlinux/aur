# Maintainer: Mads Kjeldgaard <mail@madskjeldgaard.dk>
pkgname=flucoma-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Fluid Corpus Manipulation Command line interface"
arch=('x86_64')
url="https://www.flucoma.org/"
license=('BSD')
depends=('wget' 'sed' 'tar')
makedepends=()
optdepends=()
provides=("${pkgname}")
conflicts=("flucoma-cli-git")
options=()
source=("https://github.com/flucoma/flucoma-cli/releases/download/$pkgver-RC1/FluidCorpusManipulation_CLI_Linux_$(echo $pkgver | sed 's/\./_/g')-RC1.tar.gz")
md5sums=('SKIP')

package() {

	cd "$srcdir"
	wget "$source"
	tar -xvf $(basename "$source") 

	cd FluidCorpusManipulation

	install -Dm755 ./bin/fluid-ampgate "$pkgdir/usr/bin/fluid-ampgate"
	install -Dm644 ./docs/fluid-ampgate.html "$pkgdir/usr/share/doc/$pkgname/fluid-ampgate.html"

	install -Dm755 ./bin/fluid-ampslice "$pkgdir/usr/bin/fluid-ampslice"
	install -Dm644 ./docs/fluid-ampslice.html "$pkgdir/usr/share/doc/$pkgname/fluid-ampslice.html"

	install -Dm755 ./bin/fluid-hpss "$pkgdir/usr/bin/fluid-hpss"
	install -Dm644 ./docs/fluid-hpss.html "$pkgdir/usr/share/doc/$pkgname/fluid-hpss.html"

	install -Dm755 ./bin/fluid-loudness "$pkgdir/usr/bin/fluid-loudness"
	install -Dm644 ./docs/fluid-loudness.html "$pkgdir/usr/share/doc/$pkgname/fluid-loudness.html"

	install -Dm755 ./bin/fluid-melbands "$pkgdir/usr/bin/fluid-melbands"
	install -Dm644 ./docs/fluid-melbands.html "$pkgdir/usr/share/doc/$pkgname/fluid-melbands.html"

	install -Dm755 ./bin/fluid-mfcc "$pkgdir/usr/bin/fluid-mfcc"
	install -Dm644 ./docs/fluid-mfcc.html "$pkgdir/usr/share/doc/$pkgname/fluid-mfcc.html"

	install -Dm755 ./bin/fluid-nmf "$pkgdir/usr/bin/fluid-nmf"
	install -Dm644 ./docs/fluid-nmf.html "$pkgdir/usr/share/doc/$pkgname/fluid-nmf.html"

	install -Dm755 ./bin/fluid-noveltyslice "$pkgdir/usr/bin/fluid-noveltyslice"
	install -Dm644 ./docs/fluid-noveltyslice.html "$pkgdir/usr/share/doc/$pkgname/fluid-noveltyslice.html"

	install -Dm755 ./bin/fluid-onsetslice "$pkgdir/usr/bin/fluid-onsetslice"
	install -Dm644 ./docs/fluid-onsetslice.html "$pkgdir/usr/share/doc/$pkgname/fluid-onsetslice.html"

	install -Dm755 ./bin/fluid-pitch "$pkgdir/usr/bin/fluid-pitch"
	install -Dm644 ./docs/fluid-pitch.html "$pkgdir/usr/share/doc/$pkgname/fluid-pitch.html"

	install -Dm755 ./bin/fluid-sines "$pkgdir/usr/bin/fluid-sines"
	install -Dm644 ./docs/fluid-sines.html "$pkgdir/usr/share/doc/$pkgname/fluid-sines.html"

	install -Dm755 ./bin/fluid-spectralshape "$pkgdir/usr/bin/fluid-spectralshape"
	install -Dm644 ./docs/fluid-spectralshape.html "$pkgdir/usr/share/doc/$pkgname/fluid-spectralshape.html"

	install -Dm755 ./bin/fluid-stats "$pkgdir/usr/bin/fluid-stats"
	install -Dm644 ./docs/fluid-stats.html "$pkgdir/usr/share/doc/$pkgname/fluid-stats.html"

	install -Dm755 ./bin/fluid-transients "$pkgdir/usr/bin/fluid-transients"
	install -Dm644 ./docs/fluid-transients.html "$pkgdir/usr/share/doc/$pkgname/fluid-transients.html"

	install -Dm755 ./bin/fluid-transientslice "$pkgdir/usr/bin/fluid-transientslice"
	install -Dm644 ./docs/fluid-transientslice.html "$pkgdir/usr/share/doc/$pkgname/fluid-transientslice.html"

	install -Dm644 ./license.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
