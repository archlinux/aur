# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgname=nerdfix
pkgver=0.2.2
pkgrel=1
pkgdesc="nerdfix helps you to find/fix obsolete Nerd Font icons in your project."
url="https://github.com/loichyan/$pkgname"
arch=("x86_64")
license=("MIT" "Apache")
makedepends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('380d7853c4fb1f8b041fef6126248ac935e2fcdc87b137e0a00b39958a61f498')

build()
{
    cd "$srcdir/$pkgname-$pkgver"

    cargo build --release
}

package()
{
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
