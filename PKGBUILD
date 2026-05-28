<<<<<<< HEAD
# Maintainer: Manoel Brunnen <manoel.brunnen@gmail.com>

pkgname=fetcher-rs-rs
pkgver=2.0
pkgrel=1
pkgdesc="Automatic update of git repositories via a systemd service."
arch=('any')
url="https://github.com/mbrunnen/fetcher"
license=('MIT')
groups=()
depends=('git')
install="$pkgname.install"
source=("fetcher.sh"
        "fetcher.service")
noextract=()

package() {
    install -Dm644 $srcdir/fetcher.service $pkgdir/usr/lib/systemd/user/fetcher.service
    install -Dm755 $srcdir/fetcher.sh $pkgdir/usr/bin/fetcher
}

# vim:set ft=sh:
md5sums=('7850769db5609291b9aef320b87d9f15'
         'dab6b2be6bfbd3f2b77b000814e1e9fd')
=======
# Maintainer: type1arc

pkgname=fetcher-rs-rs
_commit=f0bde1ba6131c6a55c8817f44c0508110044bc4d
pkgver=0.1.0
pkgrel=1
pkgdesc="A configurable package fetcher"
arch=('x86_64' 'aarch64')
url="https://github.com/type1arc/fetcher"
license=('Apache-2.0')
depends=('git')
makedepends=('cargo')
source=("$pkgname::https://github.com/type1arc/fetcher/archive/$_commit.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
    cd "$srcdir/fetcher"
    cargo build --release --locked
}

check() {
    cd "$srcdir/fetcher"
    cargo test --release --locked
}

package() {
    cd "$srcdir/fetcher"
    install -Dm755 target/release/fetcher "$pkgdir/usr/bin/fetcher"
    install -Dm644 package.toml "$pkgdir/usr/share/fetcher/package.toml"
}
>>>>>>> 68d6e40 (initial commit)
