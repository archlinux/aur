# Maintainer: Lyr <lyr-7d1h@pm.me>

pkgname="sworkstyle"
pkgver=1.1.0
pkgrel=1
pkgdesc="Swayest Workstyle - This tool will rename workspaces to the icons configured. Mainly meant for Sway WM" 
arch=("x86_64")
url="https://github.com/Lyr-7D1h/swayest_workstyle"
license=("MIT")
makedepends=("rust" "cargo" "git")
source=("git+${url}.git#tag=${pkgver}" 
        "sworkstyle.man") 
sha256sums=('SKIP'
            '94b1c145d40a135897dd49e4652dce52a33172894815f88e942809491f8bc07b')

build() {
    cd "$srcdir/swayest_workstyle"
    cargo build --release --locked 
}

package() {
    install -D -m755 "$srcdir/swayest_workstyle/target/release/$pkgname" "$pkgdir/usr/bin/sworkstyle"
    install -D -m644 "$srcdir/swayest_workstyle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/$pkgname.man" "$pkgdir/usr/share/man/man1/$pkgname.1"
}
