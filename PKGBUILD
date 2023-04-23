# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname="apprise"
pkgver=1.3.0
pkgrel=2
pkgdesc="Push Notifications that work with just about every platform"
url="https://github.com/caronc/apprise"
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
         "python-wheel")
options=("!strip")
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('2c50c19a5dd41317b1f659c52b21a990febe6c15e08464228a1ce8e6098f11bf')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
