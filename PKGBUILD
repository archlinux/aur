# Maintainer: mattski <redmattski at gmail dot com>

pkgname=python-audible
_name=${pkgname#python-}
pkgver=0.8.2
pkgrel=1
pkgdesc='A(Sync) Interface for internal Audible API written in'
arch=(any)
url=https://github.com/mkb79/audible
license=(AGPL3)
depends=(python python-beautifulsoup4 python-httpx python-pbkdf2 python-pillow python-pyaes python-rsa)
makedepends=('python-setuptools')
#makedepends=(python-pip)
checkdepends=()
provides=($pkgname)
conflicts=($pkgname)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('e7bb81868533016644010643d2c515e49e2334a0fb39d06aa0d82e5f7e58d0b8')

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

