pkgname=lgtv-git
pkgver=r7.2d78391
pkgrel=2
arch=('any')
url="https://github.com/ammgws/lgtv"
source=("${pkgname%-*}::git+$url")
depends=('sh' 'websocat' 'wakeonlan')
makedepends=('git')
provides=("lgtv")
conflicts=("lgtv")
md5sums=('SKIP')
license=('GPL')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-*}"
  install -Dm755 "${pkgname%-*}" "$pkgdir/usr/bin/${pkgname%-*}"
}
