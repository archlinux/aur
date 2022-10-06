# Maintainer: database64128 <free122448@hotmail.com>

_pkgname=shadowsocks-go-domain-sets
pkgname=$_pkgname-git
pkgver=20221003055316
pkgrel=1
pkgdesc="Commonly used domain sets for shadowsocks-go"
arch=('any')
url="https://github.com/database64128/$_pkgname"
license=('AGPL3')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git#branch=release")
b2sums=('SKIP')

pkgver() {
    cd $pkgname
    git show -s --format=%cd --date=format:%Y%m%d%H%M%S
}

package() {
    cd $pkgname
    install -d "$pkgdir"/usr/share/shadowsocks-go
    install -Dm644 -t "$pkgdir"/usr/share/shadowsocks-go/ *
}
