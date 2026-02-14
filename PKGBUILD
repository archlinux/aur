# Maintainer: Shaik Jameel Ur Rahaman
# Maintainer: Vijay Kumar
pkgname=novel-cli-git
pkgver=r22.9576837
pkgrel=1
pkgdesc="A terminal-based novel and webnovel reader with ncurses"
arch=('x86_64')
url="https://github.com/Rahaman146/novel-cli"
license=('GPL3')
depends=('ncurses' 'curl' 'cjson')
makedepends=('git' 'gcc' 'make')
provides=('novel-cli')
conflicts=('novel-cli')
options=('!debug')
source=("git+https://github.com/Rahaman146/novel-cli.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  # Install the binary to /usr/bin/
  install -Dm755 novel-cli "$pkgdir/usr/bin/novel-cli"
}
