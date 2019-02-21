# Maintainer: Zach Zundel <me+aur at zachzundel dot com>
pkgname=boxcli-git
pkgver=2.0.0
pkgrel=1
epoch=1
arch=('any')
pkgdesc="The CLI for Box.com"
url="https://box.com"
license=('Apache')
makedepends=('git' 'nodejs>=8.0.0' 'npm')
provides=('box')
options=()
install=
source=("git+https://www.github.com/box/boxcli")
md5sums=('SKIP')

build() {
	cd boxcli 
    npm install
    ./node_modules/.bin/oclif-dev pack --targets=linux-x64
}

package() {
    cd boxcli/dist/box-v2.0.0
    sudo tar xvf box-v2.0.0-linux-x64.tar.gz --directory /usr/lib
    sudo ln -s /usr/lib/box/bin/box /usr/bin/box
}
