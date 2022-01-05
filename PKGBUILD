# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=sdkmanager
pkgver=0.5
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

sha256sums=('95b39156a50ca84c2fffe35aa49727d66e3f8ecf0acf9e98676f051315492bcf')
