# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=prs
pkgname=$_projectname-tui
pkgver=1.0.0
pkgrel=1
pkgdesc="Stay updated on PRs from your terminal"
arch=("x86_64")
url="https://github.com/dhth/prs"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('04d66e40dcfc9188addb8771fae115aee6ff5ea3beba0a94bdf25fd5c32af44a')

build() {
    cd "$_projectname-$pkgver"
    go build
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 $_projectname "$pkgdir/usr/bin/$_projectname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
