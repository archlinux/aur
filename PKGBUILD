# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=splash
pkgname=splash-logs
pkgver=0.6.4
pkgrel=1
pkgdesc="Adds beautiful, adaptive colors to make logs easier to read."
arch=("x86_64")
url="https://github.com/joshi4/$_projectname"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('5f03f411e4bcef874ab1a11b84a6d245e68943b4d1bd566925c65af067d53ba6')

build() {
    cd "$_projectname-$pkgver"
    go build -ldflags "-X github.com/joshi4/splash/cmd.version=v99.0.0"
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 splash "$pkgdir/usr/bin/splash"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}
