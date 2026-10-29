# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="git-remote-rclone"
pkgver=0.1
pkgrel=3
pkgdesc="Git remote helper for rclone-supported services"
url="https://github.com/datalad/git-remote-rclone"
license=("MIT")
arch=("any")
depends=("python" "git" "rclone" "p7zip")
makedepends=("python-build" "python-installer" "python-setuptools" "python-wheel")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23a6608027f7399d882485502961d6a91f950157f8b4fccf3278492010c339f1')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "$pkgname-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
