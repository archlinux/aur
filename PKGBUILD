# Maintainer: Jothi Prasath <jothiprasath2@gmail.com>
pkgname=bash-scripts-git
pkgver=r27.3597e45
pkgrel=1
pkgdesc="A collection of bash scripts from https://github.com/jothi-prasath/bash-scripts"
arch=('any')
url="https://github.com/jothi-prasath/bash-scripts.git"
license=('MIT')
depends=('git' 'xclip' 'imagemagick' 'p7zip' 'tar' 'zip' 'xz' 'gzip' 'ffmpeg' 'cpupower' 'wireless_tools')

source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  rm .git .gitignore README.md LICENSE *.sh -rf
  find . -type f -exec install -Dm755 {} "${pkgdir}/usr/local/bin/{}" \;
}
