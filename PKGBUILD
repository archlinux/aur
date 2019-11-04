# Maintainer: Baz <github(a)luxolus.com>

pkgname=jaesve
pkgver=1.3.1
pkgrel=1
pkgdesc="A CLI utility for stream converting JSON objects to a series of CSV values"
url="https://github.com/bazaah/jaesve"
license=("MIT")
source=("git+https://github.com/bazaah/jaesve")
md5sums=('SKIP')
arch=('x86_64')

prepare () {
    cd "$pkgname"
    git checkout $pkgver
}

build() {
    cd "$pkgname"
    cargo build --release --locked
}

check() {
   cd "$pkgname"
   cargo test --release --locked
}

package() {
   cd "$pkgname"
   install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
}

