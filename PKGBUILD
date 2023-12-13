# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=2.0.0
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python-jsonschema python-numpy)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('e71f7f7694d382d87aa1c61daff5cae0f8a0c30f1a6f0d523460525db9b2d69d')

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	if [[ ! -e setup.py ]]; then
		curl -LO https://github.com/HEnquist/pycamilladsp-plot/raw/6da3c9004c15c0eb255d37cdba23e2b8b987dada/setup.py
		sed -i 's/version=.*/version="'$pkgver'",/' setup.py
	fi
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
