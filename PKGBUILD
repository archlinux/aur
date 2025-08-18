# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname="tp"
pkgname=transparent-pipe
pkgver=1.0.0
pkgrel=1
pkgdesc="Display the result of commands at every keystroke"
arch=("x86_64")
url="https://github.com/minefuto/tp"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('872a85df60946de6345a84bcc00f4a8a368cdfd42ad3ced560c1d1f5c5828b73')

build() {
    cd "$_projectname-$pkgver"
    go build
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 $_projectname "$pkgdir/usr/bin/$_projectname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
