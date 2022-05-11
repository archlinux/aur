# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=sdkmanager
pkgver=0.5.4
pkgrel=1
pkgdesc="a drop-in replacement for sdkmanager from the Android SDK written in Python"
arch=('any')
url="https://gitlab.com/fdroid/sdkmanager"
license=('AGPL3')
depends=(python python-argcomplete python-requests)
optdepends=(gpg)
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

sha256sums=('b9cb37c7d67d977e1588d78452520b0a75bb93ba31855336014ca60c14fb1fa3')
