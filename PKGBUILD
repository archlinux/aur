# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=splash
pkgname=splash-logs
pkgver=0.8.0
pkgrel=1
pkgdesc="Adds beautiful, adaptive colors to make logs easier to read."
arch=("x86_64")
url="https://github.com/joshi4/$_projectname"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('29da8fa74ed209539806e478273e9e83d19281619d9a1c45502180e9c906571a')

build() {
    cd "$_projectname-$pkgver"
    go build -ldflags "-X 'github.com/joshi4/splash/cmd.version=v$pkgver' -X 'github.com/joshi4/splash/cmd.externalUpdate=true'"
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 splash "$pkgdir/usr/bin/splash"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}
