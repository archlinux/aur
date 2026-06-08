# Maintainer: Shrike Linux Uganda <rootied@proton.me>
pkgname=shrike-archive
pkgver=2.1
pkgrel=1
pkgdesc="Universal Archive Manager supporting Files and Folders"
arch=('x86_64')
url="https://shrikelinuxug.org"
license=('GPL3')
depends=(
    'gtk3'
    'tar' 'gzip' 'bzip2' 'xz' 'zip' 'unzip'
    'zstd'
    'p7zip' 'unrar'
    'lrzip' 'lzip' 'ncompress' 'cpio' 'arj' 'lha' 'cabextract'
    'cdrkit'
    'squashfs-tools'
)
makedepends=('gcc' 'pkg-config')
source=("https://codeberg.org/root1/Shrike-Linux-Uganda/archive/main.tar.gz")
md5sums=('SKIP')

build() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-archive 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-archive
  gcc shrike-archive.c -o shrike-archive $(pkg-config --cflags --libs gtk+-3.0)
}

package() {
  cd "$srcdir"/Shrike-Linux-Uganda/shrike-archive 2>/dev/null || cd "$srcdir"/shrike-linux-uganda/shrike-archive
  install -Dm755 shrike-archive "$pkgdir/usr/bin/shrike-archive"
  install -Dm644 shrike-archive.desktop "$pkgdir/usr/share/applications/shrike-archive.desktop"
}
