# Maintainer: Adrien Wu <adrien.sf.wu@gmail.com>
pkgname=python2-pickleshare
pkgver=0.7.5
pkgrel=1
pkgdesc="File system based database that uses python pickles"
url="https://github.com/pickleshare/pickleshare"
arch=('any')
provides=('python2-pickleshare')
depends=('python2')
makedepends=('python2-setuptools')
_name="${pkgname#python2-}"
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('87683d47965c1da65cdacaf31c8441d12b8044cdec9aca500cd78fc2c683afca')

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
