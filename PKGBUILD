# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="apprise"
pkgver=1.2.1
pkgrel=3
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
sha256sums=('67e0c227eecee260000980dbbf8ba1e5eebdbe494f4730808297c9e645c03579')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
