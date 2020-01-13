# Maintainer: willemw <willemw12@gmail.com>

pkgname=python-qtawesome-git
pkgver=0.6.1.r2.g634112d
pkgrel=1
pkgdesc="Enables iconic fonts such as Font Awesome and Elusive Icons in PyQt and PySide applications"
arch=('any')
url="https://github.com/spyder-ide/qtawesome"
license=('MIT')
depends=('python-qtpy')
makedepends=('git' 'python-setuptools')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=($pkgname::git+$url.git)
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
} 

build() {
  cd $pkgname
  python setup.py build
}

package() {
  cd $pkgname
  python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}

