# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="git-remote-rclone"
pkgver=0.1
pkgrel=1
pkgdesc="Git remote helper for rclone-supported services"
url="https://github.com/datalad/git-remote-rclone"
license=("MIT")
arch=("any")
depends=("git" "rclone" "p7zip")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('23a6608027f7399d882485502961d6a91f950157f8b4fccf3278492010c339f1')
options=("!strip")

build(){
 cd "$pkgname-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
