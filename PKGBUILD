# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="apprise"
pkgver=1.3.0
pkgrel=1
pkgdesc="Push Notifications that work with just about every platform"
url="https://github.com/caronc/apprise"
license=("MIT")
arch=("any")
provides=("apprise" "python-apprise")
conflicts=("python-apprise")
depends=(
        "python-certifi"
        "python-click"
        "python-dataclasses"
        "python-markdown"
        "python-requests"
        "python-requests-oauthlib"
        "python-yaml")
makedepends=(
        "python-babel"
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
