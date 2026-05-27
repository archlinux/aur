# Maintainer: sfs <sfslinux@gmail.com>

pkgname=md2ansi
pkgver=1.0.2
pkgrel=1
pkgdesc='Zero-dependency C11 Markdown-to-ANSI terminal renderer'
arch=('x86_64')
url='https://github.com/Open-Technology-Foundation/md2ansi.c'
license=('GPL-3.0-or-later')
depends=('glibc' 'bash')
makedepends=('git')
optdepends=('pandoc: mdview browser preview')
source=("$pkgname::git+https://github.com/Open-Technology-Foundation/md2ansi.c.git#tag=v$pkgver")
sha256sums=('SKIP')
b2sums=('SKIP')

build() {
  cd "$pkgname"
  make CFLAGS="$CFLAGS -D_XOPEN_SOURCE=700" PREFIX=/usr
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" PREFIX=/usr install
}
