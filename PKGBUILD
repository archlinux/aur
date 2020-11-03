# Maintaoner: Yamada Hayao <hayao@fascode.net>

pkgname="alterlinux-medit-themes"
pkgver=r19.67f0543
pkgrel=1
pkgdesc="Medit themes for Alter Linux (Arc theme and Adapta theme)"
arch=('any')
url="https://github.com/FascodeNet/aptpac"
license=("custom")
depends=('medit')
makedepends=('git')
source=("git+https://github.com/FascodeNet/medit-themes")
md5sums=('SKIP')

pkgver() {
  cd "medit-themes"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    for file in "${srcdir}/medit-themes/"*.xml; do
        install -m 755 -D "${file}" "${pkgdir}/usr/share/medit-1/language-specs/$(basename ${file})"
    done
}
