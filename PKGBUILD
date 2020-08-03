# Maintainer: milk on freenode
pkgname=moddownloaderr-git
pkgver=v0.4.r13.ga8f0e2f
pkgrel=1
pkgdesc="moddownloaderr - forked Bash script to download module music from The Mod Archive"
arch=('i686' 'x86_64')
url="https://github.com/mxmilkiib/moddownloaderr"
license=('LGPL3')
depends=('wget' 'sed' 'awk')
source=(moddownloaderr-git::git+https://github.com/mxmilkiib/moddownloaderr)
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir"
}

package() {
  # cd "$srcdir"
  cd "$pkgname"
  install -Dm755 moddownloaderr $pkgdir/usr/bin/moddownloaderr
}
