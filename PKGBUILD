# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=sdkmanager
pkgver=0.5.2
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

sha256sums=('7b6311a183bf3afd46a2ae5427efd9a4f9f8315d8771ad1578685584dcccfb54')
