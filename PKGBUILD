# Maintainer: Raafat Turki <raafat.turki@pm.me>

pkgname=genxrdb
pkgver=0.1
pkgrel=1
pkgdesc='a tool that generates xresources from toml'
arch=(x86_64)
url='https://github.com/RaafatTurki/genxrdb'
makedepends=(git rust)
source=("git+$url")
cksums=('SKIP')

build() {
  cargo build \
    --manifest-path "$srcdir/$pkgname/Cargo.toml" \
    --release
}

package() {
  install -Dm755 "$srcdir/$pkgname/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
