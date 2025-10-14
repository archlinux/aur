# Maintainer: Leonardo Amaral <archlinux at leonardoamaral dot com dot br>

pkgname="git-remote-rclone-crypt"
pkgver=0.3
pkgrel=1
pkgdesc="Git remote helper for rclone-supported services with crypt support"
url="https://github.com/redstreet/git-remote-rclone"
license=("GPL-3.0")
arch=("any")
conflicts=("git-remote-rclone")
depends=("git" "rclone" "p7zip")
makedepends=("python-setuptools")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d2468e482f6d18d96616f2ae8a35ee380e0292f2a1f1f347686aa8d4a142a248')
options=("!strip")

build(){
 cd "$(echo $pkgname | xargs basename -s '-crypt')-$pkgver"
 python setup.py build
}

package(){
 cd "$(echo $pkgname | xargs basename -s '-crypt')-$pkgver"
 python setup.py install --root="$pkgdir" --optimize=1
}
