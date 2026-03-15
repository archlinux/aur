# Maintainer: Finn <finn-ja@gmx.de>

pkgname=commiefetch-git
pkgver=1.0
pkgrel=1
pkgdesc="Systeminfo-Tool mit kommunistischem ASCII-Logo, Bash-Integration und versteckten Anzeigemodi"
arch=('x86_64')
url="https://gitlab.com/arch1380517/commiefetch"
license=('GPL3')
depends=()
makedepends=('git' 'gcc')
source=("git+https://gitlab.com/arch1380517/commiefetch.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/commiefetch"
  echo "1.0.r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/commiefetch"
  gcc commiefetch.c -O2 -o commiefetch
}

package() {
  cd "$srcdir/commiefetch"
  install -Dm755 commiefetch "$pkgdir/usr/bin/commiefetch"
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
