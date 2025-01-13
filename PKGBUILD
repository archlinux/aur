# Maintainer: rern <rernrern@gmail.com>

pkgname=python-pycamilladsp-plot
pkgver=3.0.0
pkgrel=1
pkgdesc='Plotting tools for CamillaDSP'
url=https://github.com/HEnquist/pycamilladsp-plot
license=(GPL)
arch=(any)
depends=(python-jsonschema python-numpy)
makedepends=(python)
source=(https://github.com/HEnquist/pycamilladsp-plot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('92efe4a8e15bab0bbbb1a5b3f37ec0b9a26bbb0837562f3b720b54e2fb03aac5')

package() {
	cd $srcdir/pycamilladsp-plot-$pkgver
	if [[ ! -e setup.py ]]; then
		curl -LO https://github.com/HEnquist/pycamilladsp-plot/raw/6da3c9004c15c0eb255d37cdba23e2b8b987dada/setup.py
		sed -i 's/version=.*/version="'$pkgver'",/' setup.py
	fi
	env CFLAGS="-fcommon" python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
