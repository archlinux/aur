# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=sdkmanager
pkgver=0.4.1
pkgrel=1
pkgdesc="a drop-in replacement for sdkmanager from the Android SDK written in Python"
arch=('any')
url="https://gitlab.com/fdroid/sdkmanager"
license=('AGPL3')
depends=(python python-argcomplete python-requests)
makedepends=(python-setuptools)
source=("https://gitlab.com/fdroid/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")

build() {
  cd ${pkgname}-${pkgver}
  python -m compileall .
  python -O -m compileall .
}

package() {
  cd ${pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1
}

sha256sums=('cd85182b59067b0a00b7ff9768f7b4c9e1666b32544ea6a99dd6c3dd1d5e4018')
