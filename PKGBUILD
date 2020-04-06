# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=aws-requests-auth
pkgname=python-aws-requests-auth-git
pkgver=r107.969bc64
pkgrel=1
pkgdesc="AWS signature version 4 signing process for the python requests module"
url="https://github.com/davidmuller/aws-requests-auth"
license=('MIT')

source=('git+https://github.com/davidmuller/aws-requests-auth')
sha256sums=('SKIP')
arch=('any')
provides=('python-aws-requests-auth')
conflicts=('python-aws-requests-auth')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_pkgname"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname"
    python setup.py install --root="$pkgdir" --optimize=1
}
