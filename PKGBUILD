# Maintainer: Jan Oliver Oelerich <janoliver@oelerich.org> 
pkgname=python-pypdf2-git
pkgver=b17382f
pkgrel=1
pkgdesc="PyPDF2 library for Python3"
arch=('i686' 'x86_64')
url="http://mstamy2.github.com/PyPDF2"
license=('custom')
depends=('python')
conflicts=('python-pypdf-git')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/mstamy2/PyPDF2.git')
_gitname="PyPDF2"
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  echo $(git describe --always --long | sed 's/^[v]//;s/-/-r/' | tr - .)
}

build() {
  :
}

package() {
  cd "$srcdir/$_gitname"
  python setup.py install --prefix=/usr --root="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
