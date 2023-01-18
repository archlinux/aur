# Contributor: quellen <lodgerz@gmail.com>
pkgname=amitools
pkgver=0.7.0
pkgrel=2
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=('python-lhafile')
makedepends=(
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
)
provides=('amitools')
conflicts=(${provides[@]})

source=("$pkgname"::"git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  python -m build
}

package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
