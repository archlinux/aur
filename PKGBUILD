# Maintainer: quellen <lodgerz@gmail.com>
pkgname=amitools
pkgver=r.
pkgrel=1
pkgdesc="Various AmigaOS tools for other platforms"
arch=('i686' 'x86_64')
url="https://github.com/cnvogelg/amitools"
license=('GPL')
depends=('python-lhafile' 'python2' 'cython2')
source=("git+https://github.com/cnvogelg/amitools.git")
md5sums=('SKIP')
sha256sums=('SKIP')
pkgver() {
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
        cd "${pkgname}"
        python2 setup.py build
}

package() {
        cd "${pkgname}"
	python2 setup.py install --root="$pkgdir/" --prefix=/usr
} 