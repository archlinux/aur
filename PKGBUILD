# Maintainer: Christoph Gysin <christoph.gysin@gmail.com>

_pkgname=httpie-aws-authv4
pkgname=httpie-aws-authv4-git
pkgver=r22.6165193
pkgrel=1
pkgdesc="AWSv4 auth plugin for HTTPie"
url="https://github.com/aidan-/httpie-aws-authv4"
license=('MIT')

source=('git+https://github.com/aidan-/httpie-aws-authv4')
sha256sums=('SKIP')
depends=('httpie' 'python-aws-requests-auth')
arch=('any')
provides=('httpie-aws-authv4')
conflicts=('httpie-aws-authv4')

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
