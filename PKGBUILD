# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=myss-git
pkgver=r71.79e7d47
pkgrel=1
pkgdesc='A Simple Program Which Enables You To Have Screenshot Every 1 Minute'
arch=('any')
url='http://sadegh.io/myss'
license=('GPL3')
provides=('myss')
depends=('scrot')
source=("${pkgname%-git}::git+https://github.com/Alirezaies/myss")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}/Linux/"
  install -Dm755 myss.sh "${pkgdir}/usr/bin/myss"
}