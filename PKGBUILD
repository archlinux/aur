# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=splash
pkgname=splash-logs
pkgver=0.6.3
pkgrel=1
pkgdesc="Adds beautiful, adaptive colors to make logs easier to read."
arch=("x86_64")
url="https://github.com/joshi4/$_projectname"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e36b2a95045bc5053f86bc3c2a53143b7f15b9bc500c0e1c28ddec9777e13125')

build() {
    cd "$_projectname-$pkgver"
    go build -ldflags "-X github.com/joshi4/splash/cmd.version=v99.0.0"
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 splash "$pkgdir/usr/bin/splash"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}
