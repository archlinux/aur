# Contributor: quellen <lodgerz@gmail.com>
pkgname=amitools
pkgver=0.6.0
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=('python-lhafile' 'python' 'cython')
conflicts=('amitools')
provides=('amitools')

source=(
  "$pkgname-$pkgver"::"https://github.com/cnvogelg/amitools/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
  '2db5de38bd4858bafd4d01c195ddad7d327e681f30eca436e68e9902ca6c80aa'
)

build() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "${srcdir}/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --prefix=/usr
} 
