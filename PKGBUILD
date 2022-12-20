# Maintainer: Bipin Kumar <bipin@ccmb.res.in>

pkgname=cutadapt
_module=cutadapt
_name=cutadapt
pkgver=4.2
_pkgver=4.2
pkgrel=1
pkgdesc='Remove adapter sequences from high-throughput sequencing reads. doi:10.14806/ej.17.1.200'
arch=('x86_64')
url="https://github.com/marcelm/cutadapt"
license=('MIT')
depends=(
         'python'
         'python-xopen'
         'python-dnaio'
         )
makedepends=(
            'python-setuptools'
            'cython'
            'python-setuptools-scm'
            )
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('ab0ac450baecc1576cc5ccbc06eab2685be9ee7676763938237d954a644237f1')

build() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm644 "$srcdir/$_name-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
