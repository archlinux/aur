# Maintainer: AlphaJack <alphajack at tuta dot io>
# Maintainer: Pieter Goetschalckx <3.14.e.ter <at> gmail <dot> com>

pkgname="apprise"
pkgver=1.4.5
pkgrel=1
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
         "python-setuptools"
         "python-wheel")
options=("!strip")
source=("$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('b7c66513c5456690a298ed887c9016ded42f15e365d16142e728b74f7cffee82')

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
