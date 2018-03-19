# Maintainer: wedjat <wedjat@protonmail.com>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>

pkgname=python-nitime
pkgver=0.7
pkgrel=1
pkgdesc="A library for time-series analysis of neuroscience data."
arch=("x86_64")
url="http://nipy.org/nitime/"
license=('BSD')
depends=('python' 'python-numpy' 'python-matplotlib' 'python-scipy') # ('python-sphinx' 'python-nibabel' 'python-networkx) # building documentation (but did not try so far)
makedepends=('python-setuptools' 'cython')
checkdepends=()
optdepends=('python-nibabel: for reading in data from fMRI data files' 'python-networkx: for some visualization functions')
options=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/nipy/nitime/archive/rel/$pkgver.tar.gz")
md5sums=('6b5896db6b7d65660291640bf4027681')


build() 
{
	cd "$srcdir/nitime-rel-$pkgver"
	python setup.py build

}

package() 
{
	cd "$srcdir/nitime-rel-$pkgver"
	python setup.py install --root="$pkgdir"/ --skip-build --optimize=1

}
