# Maintainter: Árni Dagur <arnidg@protonmail.ch>
# Adapted from original PKGBULID written by: Sébastien "Seblu" Luttringer <seblu@archlinux.org>

pkgname=gzip-with-pigz-symlinks
pkgver=1.10
pkgrel=1
pkgdesc='gzip with binary symlinked to pigz'
arch=('x86_64')
url='https://www.gnu.org/software/gzip/'
license=('GPL3')
depends=('pigz' 'bash' 'less')
provides=('gzip')
conflicts=('gzip')
source=("https://ftp.gnu.org/pub/gnu/gzip/gzip-$pkgver.tar.xz")
md5sums=('691b1221694c3394f1c537df4eee39d3')

build() {
  cd gzip-$pkgver
  ./configure prefix=/usr
  make
}

package() {
  cd gzip-$pkgver

  make prefix="$pkgdir"/usr install
  ln -sf pigz "$pkgdir"/usr/bin/gzip
}
