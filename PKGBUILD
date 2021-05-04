# Maintainer : Yamada Hayao <development@fascode.net>
# Maintainer : lap1sid <development@fascode.net>

_pkgname="alterlinux-wallpapers"
pkgname="${_pkgname}"
pkgver="7.2"
pkgrel=1
pkgdesc='AlterLinux wallpapers'
arch=('any')
url='https:/fascode.net'
source=("https://github.com/FascodeNet/alterlinux-wallpapers/archive/refs/tags/v${pkgver}.zip")    
md5sums=("SKIP")
install="${pkgname}.install"

maindirname="${_pkgname}-${pkgver}"

package() {
    cd "${srcdir}/${maindirname}"

    # Install files
    find "${srcdir}/${maindirname}/images" -type f -name "*.png" -print0 | xargs -0 -I{} install -Dm644 --target-directory="${pkgdir}/usr/share/backgrounds/" {}

    find "${srcdir}/${maindirname}/scripts" -type f -print0 | xargs -0 -I{} install -Dm755 --target-directory="${pkgdir}/usr/share/libalpm/scripts/" {}

    find "${srcdir}/${maindirname}/hooks" -type f -name "*.hook" -print0 | xargs -0 -I{} install -Dm644 --target-directory="${pkgdir}/usr/share/libalpm/hooks/" {}
}
