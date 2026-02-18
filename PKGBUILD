pkgname=wefetch
pkgver=1.2.0
pkgrel=1
pkgdesc="A fast, customizable system information tool for Linux"
arch=('x86_64')
url="https://github.com/Nick-cpp/wefetch"
license=('GPL')
depends=('glibc')
makedepends=('git' 'gcc')
# Используем подстановку шелла для всех txt файлов
source=("wefetch.c" 
        "alpine.txt" "android.txt" "antix.txt" "arch.txt" "artix.txt" 
        "debian.txt" "endeavouros.txt" "fedora.txt" "gentoo.txt" "kali.txt" 
        "macos.txt" "mint.txt" "mxlinux.txt" "nixos.txt" "opensuse.txt" 
        "slackware.txt" "tails.txt" "ubuntu.txt" "void.txt")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
  gcc -o wefetch wefetch.c
}

package() {
  install -Dm755 wefetch "$pkgdir/usr/bin/wefetch"
  install -d "$pkgdir/usr/share/wefetch/logos"
  cp *.txt "$pkgdir/usr/share/wefetch/logos/"
}
