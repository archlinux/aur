# Maintainer: Tosuke <tasukeprg at gmail dot com>

pkgname=('harbored-mod')
pkgver=0.2.1
pkgrel=1
pkgdesc="A documentation generator for D with support for both DDoc and Markdown."
arch=('i686' 'x86_64')
url="https://github.com/dlang-community/harbored-mod"
license=('Boost Software License')
makedepends=('dmd' 'git')
depends=('libphobos')

source=("git+https://github.com/dlang-community/harbored-mod#tag=v$pkgver")
sha256sums=("SKIP")

prepare() {
  cd "$srcdir/harbored-mod"

  git submodule update --init --recursive
}

build() {
  cd "$srcdir/harbored-mod"
  make
}

package() {
  # binaries
  install -Dm755 "$srcdir/harbored-mod/bin/hmod" "$pkgdir/usr/bin/hmod"

  # licence
  install -Dm755 "$srcdir/harbored-mod/LICENSE_1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


