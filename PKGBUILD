# Maintainer: Phillip S. Kajubi <pintert3 at kalabentate dot com>

pkgname=vhdl-ls-bin
pkgver=0.86.0
pkgrel=1
pkgdesc="Language server for VHDL Written in rust"
arch=(x86_64)
url="github.com/VHDL-LS/rust_hdl"
license=('MPL-2.0')
depends=()
makedepends=()
provides=('vhdl-ls')
conflicts=('rust_hdl')
source=("vhdl_ls-$pkgver.zip::https://github.com/VHDL-LS/rust_hdl/releases/download/v$pkgver/vhdl_ls-x86_64-unknown-linux-gnu.zip")
sha256sums=('ab36f64af259ff55132ac4a892ee98ac726228801b6ed6b1c7abe75ff6ac0cfe')

package() {
    cd "vhdl_ls-x86_64-unknown-linux-gnu"
    install -Dm755 bin/vhdl_ls "$pkgdir/usr/bin/vhdl_ls"
    install -dm755 "$pkgdir/usr/lib/rust_hdl"
    cp -r vhdl_libraries "$pkgdir/usr/lib/rust_hdl/vhdl_libraries"

}

