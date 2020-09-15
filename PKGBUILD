# Maintainer: Matthias gatto <uso.cosmo.ray at gmail dot com>
# Reference: PKGBUILD(5)

pkgname=corny-jokes-git
pkgver=r50.49d5e2d
pkgrel=1
pkgdesc='Get ready for some painful insults...'

arch=('any')
url='https://github.com/kz6fittycent/corny-jokes'

license=(BSD)

pkgver() {
  cd "${srcdir}/corny-jokes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=('python-setuptools')
depends=()

source=("git://github.com/kz6fittycent/corny-jokes.git")
sha256sums=("SKIP")

build() {
        cd "${srcdir}/corny-jokes"
        python ./setup.py build
}

package() {
        cd "${srcdir}/corny-jokes"
        python  ./setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
