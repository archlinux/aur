makedepends=('python-setuptools')
depends=('python-socks' 'python-beautifulsoup4' 'python-markdown' 'python-wordpress-xmlrpc')
source=("git+https://github.com/black-desk/markpress#branch=master")
arch=('any')
pkgname='python-markpress-git'
pkgver=2.0.2.r0.g4c284b8
pkgrel=1
md5sums=('SKIP')
pkgver() {
  cd markpress
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd markpress
    python setup.py build
}

package() {
    cd markpress
    python setup.py install --root="$pkgdir" --optimize=1
}
