# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible-cli
_name=${pkgname#python-}
pkgver=0.2.4
pkgrel=2
pkgdesc='Command line interface (cli) for the audible package.'
arch=(any)
url=https://github.com/mkb79/audible-cli
license=(AGPL3)
depends=('python' 'python-aiofiles' 'python-audible' 'python-click' 'python-httpx' 'python-packaging' 'python-pillow' 'python-questionary' 'python-tabulate' 'python-toml' 'python-tqdm' 'python-rfc3986>=1.3.0' 'python-rfc3986<2.0.0')
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
#  mv $srcdir/$_name/bin $pkgdir/usr/
#  cp -r $srcdir/$_name/* $pkgdir/"$sitepackages"
    cd $srcdir/${_name}-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
