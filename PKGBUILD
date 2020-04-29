# Maintainer: Christian Krause ("wookietreiber") <kizkizzbangbang@googlemail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-cutadapt
pkgver=2.10
pkgrel=1
pkgdesc='Trim adapters from high-throughput sequencing reads'
arch=('x86_64' 'i686')
url="http://cutadapt.readthedocs.io/en/v$pkgver/"
license=('MIT')
depends=('python')
makedepends=('cython' 'git')
provides=('cutadapt')
conflicts=('python2-cutadapt')
source=("git+https://github.com/marcelm/cutadapt.git#tag=v$pkgver")
md5sums=('SKIP')

build() {
  cd $srcdir/cutadapt

  python setup.py build
}

package() {
  cd $srcdir/cutadapt

  python setup.py install --root=$pkgdir --optimize=1

  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
