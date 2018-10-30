# Maintainer: Vasia Novikov <n1dr+cmarchlinux@yaaandex.com> (replace "aaa" with "a")

pkgname=rua
pkgver=0.6.1
pkgrel=1
pkgdesc='convenient jailed AUR helper in rust'
url='https://github.com/vn971/rua'
source=("https://github.com/vn971/rua/archive/${pkgver}.tar.gz")
arch=('x86_64' 'i686')
license=('GPL3')
makedepends=('cargo')
depends=('bubblewrap' 'git')

sha256sums=(430bb889e8b8be352a4a206a035de7396fd8eeb766b938c50d3e4b7180189f93)

build () {
  cd "$srcdir/$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 "target/release/rua" "${pkgdir}/usr/bin/rua"
}
