# Maintainer: Mike Cuche <cuche@mailbox.org>

pkgname='twik-git'
pkgver=r52.004a764
pkgrel=1
pkgdesc="A commandline hash-based password generator"
url="https://github.com/coxande/Twik"
arch=('any')
license=('GPL')
depends=('python')
makedepends=('git' 'python-setuptools')
source=('git+https://github.com/coxande/Twik')
sha512sums=('SKIP')

pkgver() {
  cd Twik
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd Twik
  python setup.py install --optimize=1 --root="$pkgdir/"
}
