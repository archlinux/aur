# Maintainer: RubixDev <silas dot groh at t-online dot de>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=kvantum-theme-orchis-git
_gitname=Orchis-kde
pkgver=r33.57fd1b4
pkgrel=1
pkgdesc="Orchis theme for Kvantum"
arch=('any')
url="https://github.com/vinceliuice/Orchis-kde"
license=('GPL3')
depends=('kvantum')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}" 'orchis-kde-theme-git')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$_gitname"
  install -d "$pkgdir/usr/share"
  cp -r Kvantum "$pkgdir/usr/share"
}
