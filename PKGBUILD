# Maintainer: Reyzer <reyzervt@gmail.com>
pkgname=nfx
pkgver=1.1.0
pkgrel=1
pkgdesc="NFX archive tool written in C using Zstandard, libzip and libarchive"
arch=('x86_64')
url='https://github.com/ReyzerMC/nfx'
license=('MIT')
depends=('zstd' 'libzip' 'libarchive')
makedepends=('gcc' 'make' 'git')
source=("git+${url}.git") # <--- Usa git+ y apunta al tag de la versión estable
sha256sums=('SKIP')

build() {
  cd "$srcdir/nfx" # La carpeta siempre se llamará nfx al clonar el repo
  make clean
  make
}

package() {
  cd "$srcdir/nfx"

  install -Dm755 nfx "$pkgdir/usr/bin/nfx"

  if [ -f README.md ]; then
    install -Dm644 README.md "$pkgdir/usr/share/doc/nfx/README.md"
  fi
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/nfx/LICENSE"
  fi
}