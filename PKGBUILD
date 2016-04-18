# Maintainer: David Vogt <dave at winged dot ch>
# This PKGBUILD is maintained at https://github.com/winged/aur-packages

pkgname=worklog-git
pkgver=0.r31.ee40ae0
pkgrel=1
pkgdesc="A script to help you manage your notes and access them quickly"
arch=('any')
license=('BSD')
url='https://github.com/winged/worklog'
depends=('python' 'sqlite')
provides=('worklog')
conflicts=()
optdepends=()

source=("$pkgname::git://github.com/winged/worklog.git")
sha256sums=('SKIP')
pkgver() {
  cd "${pkgname}"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"
  if [ ! -d "$pkgdir/usr/bin" ]; then
    mkdir -p "$pkgdir/usr/bin"
  fi
  install work "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
