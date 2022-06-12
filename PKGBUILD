# Maintainer: Wu Zhenyu <wuzy01@qq.com>
_repo=adah1972/tellenc

pkgname=$(tr A-Z a-z <<< ${_repo##*/})
pkgver=r35.dac04c7
pkgrel=1
pkgdesc="$(gh repo view --json description -q.description $_repo)"
arch=(x86_64)
url=https://github.com/$_repo
license=(Unlicense)
source=("git+https://github.com/$_repo")
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  g++ $pkgname.cpp -o$pkgname
  install -D "$pkgname" -t "$pkgdir/usr/bin"
}
