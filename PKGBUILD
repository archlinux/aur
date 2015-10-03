# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=wtftw
pkgver=1.2
pkgrel=1
pkgdesc='Window Tiling For The Win. A tiling window manager written in Rust'
arch=('i686' 'x86_64')
url="https://github.com/Kintaro/wtftw"
license=('custom')
depends=('rust'
         'xorg-xmessage')
makedepends=('cargo' 'git')
install=wtftw.install
source=("https://github.com/Kintaro/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('14bcf2a3a324a44ab494aaf3d3d8dd55')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 target/release/wtftw \
    "${pkgdir}"/usr/bin/wtftw

  install -D config/config.rs \
    "${pkgdir}"/usr/share/wtftw/config.rs

  install -D LICENSE \
    "${pkgdir}"/usr/share/licenses/wtftw/LICENSE
}
