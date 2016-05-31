# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=cutadapt
pkgname=python-$_pkgname
pkgver=1.10
pkgrel=1
pkgdesc='trim adapters from high-throughput sequencing reads'
arch=('i686' 'x86_64')
url="https://github.com/marcelm/cutadapt"
license=('custom')
depends=('cython')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/marcelm/cutadapt/archive/v$pkgver.tar.gz")
md5sums=('2cc52e76fcc5d3d41d89bf65d01794f8')
provides=('cutadapt')
conflicts=('python2-cutadapt')

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
