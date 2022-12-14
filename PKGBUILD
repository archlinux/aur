# Maintainer: Sanpi <sanpi+aur@homecomputing.fr>
pkgbase=espflash
pkgname=('cargo-espflash' 'espflash')
pkgver=1.7.0
pkgrel=1
pkgdesc="A command-line tool for flashing Espressif devices over serial"
url="https://github.com/esp-rs/espflash"
arch=("x86_64")
license=("MIT" "Apache")
depends=("cargo")
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3efdbcc6edeaadd4beca9c685a24486ee14729b3f638e963363328c95c89f1a3')

build()
{
    cd "$srcdir/$pkgbase-$pkgver"

    cargo build --release
}

package_espflash()
{
    cd "$srcdir/$pkgbase-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

package_cargo-espflash()
{
    cd "$srcdir/$pkgbase-$pkgver"

    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm 644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
