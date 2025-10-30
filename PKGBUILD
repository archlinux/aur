# Maintainer: Joseph Hendrix <joeylhendrix@gmail.com>
pkgname='rsls-git'
pkgver=1.2.1
pkgrel=5
pkgdesc="ls with icons, written in Rust"
arch=("x86_64")
url="https://github.com/joeleehen/rsls"
license=('unknown')
depends=(gcc-libs glibc ttf-nerd-fonts-symbols)
makedepends=(git cargo)
source=('rsls::git+https://github.com/joeleehen/rsls.git#branch=master')
sha256sums=('SKIP')

build() {
    cd "rsls"
    cargo b --release
    # make
}

package() {
    echo "$srcdir"
    cd "$srcdir/rsls/target/release"
    install -Dm755 rsls "$pkgdir/usr/bin/rsls"
}
