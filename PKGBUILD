# Contributor: quellen <lodgerz@gmail.com>
_pkgname=amitools
pkgname="$_pkgname"
pkgver=0.7.0
pkgrel=3
pkgdesc="Various tools for using AmigaOS programs on other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=(
  'glibc'
  'python'
  'python-lhafile'
)
makedepends=(
  'cython'
  'git'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-setuptools-scm'
  'python-wheel'
)
provides=("$_pkgname")
conflicts=(${provides[@]})

source=("$_pkgname"::"git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$_pkgname"
  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
} 
