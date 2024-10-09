# Maintainer: lstnbl<jialanxin1996@hotmail.com>
pkgname=fanyi-git
_pkgname=fanyi
pkgver=0.1.1
pkgrel=1
arch=("x86_64")
url="https://github.com/jialanxin/fanyi.git"
pkgdesc='(Rust ver.)A CN and US translate tool in your command line.'
source=("git+https://github.com/jialanxin/fanyi.git#tag=v$pkgver")
sha1sums=('SKIP')
depends=("gcc-libs")
makedepends=("git" "cargo")
build(){
    cd $_pkgname
    cargo build --release --locked
}
package(){
    cd $_pkgname
    install -Dm 755 "target/release/${_pkgname}" -t "${pkgdir}/usr/bin"
    ln -s  "$pkgdir/usr/bin/fanyi" "$pkgdir/usr/bin/fy"
}