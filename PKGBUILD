# Maintainer: Leonardo Amaral <archlinux at leonardoamaral dot com dot br>

pkgname="git-remote-rclone-crypt"
pkgver=0.2
pkgrel=1
pkgdesc="Git remote helper for rclone-supported services with crypt support"
url="https://github.com/redstreet/git-remote-rclone"
license=("MIT")
arch=("any")
conflicts=("git-remote-rclone")
depends=("git" "rclone" "p7zip")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d4b2fcabc4b57cdc0eb8e115518ee67f988ae5a8be0f229c455b0b6fc060c6fb')
options=("!strip")

build(){
 cd "$(echo $pkgname | xargs basename -s '-crypt')-$pkgver"
 python setup.py build
}

package(){
 cd "$pkgname-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
