# Maintainer: fk29g <fk29g.uphill912@slmails.com>
_projectname=snip
pkgname=${_projectname}-go
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple and minimal command-line snippet manager"
arch=("x86_64")
url="https://github.com/mehran-prs/$_projectname"
license=("MIT")
makedepends=("go")
provides=("$pkgname")
conflicts=("$pkgname")
source=("$_projectname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bc0c6135b173b7e3e4cd33270fc64497b6d3a279aad5ae45538baba94ab68456')

build() {
    cd "$_projectname-$pkgver"
    go build
}

package() {
    cd "$_projectname-$pkgver"
    install -Dm 0755 $_projectname "$pkgdir/usr/bin/$_projectname"
    install -Dm 0644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
