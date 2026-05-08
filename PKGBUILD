# Maintainer: Cole Bohte <colebohte@rivergames.ca>
pkgname=refetsh-git
pkgver=1.0.r5.d979d5b
pkgrel=1
pkgdesc="A simple system fetch script written in UNIX shell."
arch=('any')
url="https://github.com/colebohte/refetsh"
license=('GPL3')
depends=('bash' 'glib2' 'xorg-xdpyinfo')
makedepends=('git')
provides=('refetsh')
conflicts=('refetsh')
source=("refetsh::git+https://github.com/colebohte/refetsh.git")
sha256sums=('SKIP')

pkgver() {
  cd "refetsh"
  printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "refetsh"
  install -Dm755 refetsh "$pkgdir/usr/bin/refetsh"
}
