
# Maintaoner: Yamada Hayao <development@fascode.net>

pkgname="cinnamenu"
pkgver=r3856.98944381
pkgrel=1
pkgdesc="A flexible menu providing formatting options, web bookmarks, search provider support and fuzzy searching."
arch=('any')
url="https://cinnamon-spices.linuxmint.com/applets/view/322"
license=('GPLv3')
#depends=('cinnamon')
makedepends=('git')
source=(
    # Old source
    #"https://cinnamon-spices.linuxmint.com/files/applets/Cinnamenu@json.zip"

    # GitHub Source
    "git+https://github.com/linuxmint/cinnamon-spices-applets.git"
)
md5sums=('SKIP')

pkgver() {
  #date +%Y%m%d

  cd "cinnamon-spices-applets"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    mkdir -p "${pkgdir}/usr/share/cinnamon/applets/"
    #cp -r "${srcdir}/Cinnamenu@json" "${pkgdir}/usr/share/cinnamon/applets/"
    cp -r "${srcdir}/cinnamon-spices-applets/Cinnamenu@json" "${pkgdir}/usr/share/cinnamon/applets/"
    chmod 755 -R "${pkgdir}/usr/share/cinnamon/applets/"
}
