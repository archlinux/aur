# Maintainer: quellen <lodgerz@gmail.com>
_pkgname=amitools
pkgname="${_pkgname}-git"
pkgver=0.6.0.r49.gd5a2eed
pkgrel=1
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=('python-lhafile' 'python' 'cython')
conflicts=('amitools')
provides=('amitools')

source=("$pkgname"::"git+https://github.com/cnvogelg/amitools.git")
sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/; s/-/./g; s/^v//'
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="$pkgdir/" --prefix=/usr
} 
