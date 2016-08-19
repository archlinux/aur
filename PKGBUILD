# Maintainer: Mark Egan-Fuller <markeganfuller at googlemail dot com>
pkgname=rcs-fast-export-git
pkgver=r74.c8a2bd6
pkgrel=1
pkgdesc='RCS fast export git master'
arch=('any')
url='https://github.com/Oblomov/rcs-fast-export'
license=('unknown')
depends=('ruby' 'git')
makedepends=('git')
source=("${pkgname}::git+${url}.git")
noextract=()
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "rcs-fast-export.rb" "$pkgdir/usr/bin/rcs-fast-export"
}
