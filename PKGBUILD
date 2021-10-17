# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

pkgname=python-pacman
pkgver=0.4.2
pkgrel=1
pkgdesc='Simple Python interface to Arch Linux package manager (pacman)'
url='https://github.com/peakwinter/python-pacman'
license=('GPLv3')
arch=('any')
depends=('python')
makedepends=('git' 'python-setuptools')
source=("$pkgname::git+$url.git#tag=$pkgver")
sha512sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags | sed 's/-/+/g'
}

package() {
    cd "${pkgname}"
    python3 setup.py install --root="${pkgdir}" --optimize=1
}

