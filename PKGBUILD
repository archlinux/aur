# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=splash
pkgname=splash-logs
pkgver=0.9.5
pkgrel=1
pkgdesc="Adds beautiful, adaptive colors to make logs easier to read."
arch=("x86_64")
url="https://github.com/joshi4/$_projectname"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0b0e30ad4985e9a8079bd3a6f14b810cbeaa878e4c8d425f45b8a4c27e472b94')

build() {
    cd "$_projectname-$pkgver"
    go build -ldflags "-X 'github.com/joshi4/splash/cmd.version=v$pkgver' -X 'github.com/joshi4/splash/cmd.externalUpdate=true'"
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 splash "$pkgdir/usr/bin/splash"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$_projectname/LICENSE"
}
