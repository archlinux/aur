# Maintainer: levinit <levinit@outlook.com>
pkgname=gimp-plugin-export-layers
pkgver=4.1
pkgrel=1
gimpver=2.0
pkgdesc="Export layers as separate images (GIMP 2.8/2.10 only; use Batcher for GIMP 3)"
arch=(any)
url="https://github.com/kamilburda/gimp-export-layers"
license=('BSD-3-Clause')
depends=('gimp' 'python2-gimp' 'libffi')
groups=(gimp-plugins)
makedepends=('unzip')

source=("https://github.com/kamilburda/gimp-export-layers/releases/download/${pkgver}/export_layers-${pkgver}.zip")
sha256sums=('6962e238ca21bca4a438d22a52fda43e84e21028ba0322ee7e08521aadd4202e')

package() {
	install -Ddm755 "$pkgdir/usr/lib/gimp/$gimpver/plug-ins"
	cd "$srcdir"
	cp -r export_layers.py export_layers -t "${pkgdir}/usr/lib/gimp/${gimpver}/plug-ins/"
	install -Dm644 "$srcdir/export_layers/docs/sections/LICENSE.txt" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
