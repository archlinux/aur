# Maintainer: RaphGL <raphfl.dev@gmail.com>
pkgname=neosent-git
pkgver=v1.2
pkgrel=1
epoch=1
pkgdesc="Suckful Sent - plaintext slide presentations"
arch=('any')
url="https://github.com/RaphGL/NeoSent"
license=('GPLv3')
makedepends=('make' 'git')
source=("git+$url")
md5sums=("SKIP")

build() {
    cd NeoSent
    git checkout $pkgver
    make
}

package() {
    cd NeoSent
    install -Dm0755 -t "$pkgdir/usr/bin/" "nsent"
}
