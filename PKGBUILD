# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible-series
_name=${pkgname#python-}
pkgver=1.0.2
pkgrel=1
pkgdesc='Adds a command to audible-cli that looks for new series releases in a user'"'"'s library.'
arch=(any)
url=https://github.com/luscoma/audible-series
license=(APACHE)
depends=(python python-audible python-yaml)
makedepends=('python-setuptools')
#makedepends=(python-pip)
checkdepends=()
provides=($pkgname)
conflicts=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('8081bdc71cb11c641ac33f27398ab3669505d281c7047c5a7fa1937c586e6d01')

build() {
#  pip install --no-deps --target=$_name $_name==$pkgver
    cd $srcdir/${_name}-$pkgver
    python setup.py build
}
package() {
#  sitepackages=$(python -c "import site; print(site.getsitepackages()[0])")
#  mkdir -p $pkgdir/"$sitepackages"
#  cp -r $srcdir/$_name/* $pkgdir/"$sitepackages"
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}

