_pkgbase=autoportforward
pkgname=$_pkgbase-git
pkgver=r15.38558a1
pkgrel=1
pkgdesc="Bidirectional port-forwarding for docker and kubernetes"
url="https://github.com/ruoshan/autoportforward"
arch=('any')
makedepends=('git' 'go')
provides=("$_pkgbase")
conflicts=("$_pkgbase")
source=("$_pkgbase::git+https://github.com/ruoshan/autoportforward.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  sh ./build.sh
}

package() {
  cd "$srcdir/$_pkgbase"
  install -Dm755 apf "$pkgdir/usr/bin/apf"
}
