# Maintainer: RodAlc24 <rodalc24 gmail com>

pkgname=baup-git
pkgver=0.2.1
pkgrel=1
pkgdesc='An easy way to make backups.'
arch=('x86_64')
license=('MIT')
makedepends=('rust' 'git')
depends=('gcc-libs' 'glibc')
url=https://github.com/RodAlc24/baup/
source=(baup::git+https://github.com/RodAlc24/baup.git)
sha256sums=(SKIP)

build() {
  
  cd baup
  cargo build --release

}

package() {

  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/share/zsh/site-functions/"
  mkdir -p "$pkgdir/usr/share/licenses/$pkgname"

  install -m 0755 "$srcdir/baup/target/release/baup" "$pkgdir/usr/bin/"
  install -m 0644 "$srcdir/baup/_baup" "$pkgdir/usr/share/zsh/site-functions/"
  install -m 0644 "$srcdir/baup/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

}

