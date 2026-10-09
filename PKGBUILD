# Maintainer: Damjan Georgievski <gdamjan@gmail.com>

pkgname=sdkmanager
pkgver=0.7.1 # renovate: datasource=gitlab-tags depName=fdroid/sdkmanager
pkgrel=1
pkgdesc="a drop-in replacement for sdkmanager from the Android SDK written in Python"
arch=('any')
url="https://gitlab.com/fdroid/sdkmanager"
license=('AGPL3')
depends=(python python-argcomplete python-requests)
optdepends=(gnupg)
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

sha256sums=('68ec4f15d880d93ba94ced17522099ebfd8ae88d284c39529350191775adec22')
