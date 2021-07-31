# Maintainer: Nicolas Gaffney <gaffclant@gmail.com>
pkgname=python-scpreader
pkgver=0.2.6
pkgrel=1
pkgdesc="Read the SCP wiki from the terminal"
arch=(x86_64)
url="https://github.com/gaffclant/scp-reader"
license=('GPL')
depends=('python>=3.9')
makedepends=('python-setuptools')
backup=('etc/pacman.conf')
_name=${pkgname#python-}
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('SKIP')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m setuptools.launch setup.py build
}

package() {
  cd "$_name-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --optimize=1 --root="${pkgdir}"
}
