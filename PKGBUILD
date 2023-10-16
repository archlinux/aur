# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname="apprise"
pkgver=1.6.0
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
license=("BSD3 Clause")
arch=("any")
provides=("apprise" "python-apprise")
conflicts=("python-apprise")
depends=("python-certifi"
         "python-click"
         "python-markdown"
         "python-requests"
         "python-requests-oauthlib"
         "python-pyaml")
makedepends=("python-babel"
         "python-build"
         "python-installer"
         "python-setuptools"
         "python-wheel")
options=("!strip")
source=(apprise-${pkgver}.tar.gz::"https://github.com/caronc/apprise/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0e3d7eb7ffe57fc4edce5632c5eb415845b9a9d55b99e66fa1941948697c4891')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
