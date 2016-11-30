# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>

_pkgname=cutadapt
pkgname=python-$_pkgname
pkgver=1.12
pkgrel=1
pkgdesc='trim adapters from high-throughput sequencing reads'
arch=('i686' 'x86_64')
url="http://cutadapt.readthedocs.io/en/v$pkgver/"
license=('custom')
depends=('python')
makedepends=('cython')
provides=('cutadapt')
conflicts=('python2-cutadapt')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/marcelm/cutadapt/archive/v$pkgver.tar.gz")
md5sums=('6f39ba00b1d71078d431f0c407b4d884')

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py build
}

package() {
  cd $srcdir/$_pkgname-$pkgver

  python setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
