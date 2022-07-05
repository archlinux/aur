_pkgname="xinux-wallpapers"
pkgname="${_pkgname}"
pkgver="1.2"
pkgrel=1
pkgdesc='Xinux wallpapers'
arch=('any')
url='https://oss.uzinfocom.uz'
source=("https://github.com/uzinfocom-org/wallpapers/archive/refs/tags/v${pkgver}.zip")    
md5sums=("SKIP")
install="${pkgname}.install"

maindirname="wallpapers-${pkgver}"

package() {
    cd "${srcdir}/${maindirname}"

    # Install files
    find "${srcdir}/${maindirname}/images" -type f -name "*.png" -print0 | xargs -0 -I{} install -Dm644 --target-directory="${pkgdir}/usr/share/backgrounds/" {}

    find "${srcdir}/${maindirname}/scripts" -type f -print0 | xargs -0 -I{} install -Dm755 --target-directory="${pkgdir}/usr/share/libalpm/scripts/" {}

    find "${srcdir}/${maindirname}/hooks" -type f -name "*.hook" -print0 | xargs -0 -I{} install -Dm644 --target-directory="${pkgdir}/usr/share/libalpm/hooks/" {}
}
