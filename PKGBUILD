# Maintainer : Yamada Hayao <development@fascode.net>
# Maintainer : lap1sid <development@fascode.net>

_pkgname="alterlinux-wallpapers"
pkgname="${_pkgname}"
pkgver="7.1"
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
    

    # OLD CODE
    #install -Dm644 "${srcdir}/alter.png" "${pkgdir}/usr/share/backgrounds/alter.png"
    #for image in "${srcdir}"/alter-*.png; do
    #   install -Dm644 "${srcdir}/$(basename ${image})" "${pkgdir}/usr/share/backgrounds/$(basename ${image})"
    #done

    #install -Dm644 "${srcdir}/alter-old.png" "${pkgdir}/usr/share/backgrounds/alter-old.png"
    #install -Dm644 "${srcdir}/alter-jiju.png" "${pkgdir}/usr/share/backgrounds/alter-jiju.png"
    #install -Dm644 "${srcdir}/alter-nochr.png" "${pkgdir}/usr/share/backgrounds/alter-nochr.png"

    # Install Scripts
    #install -Dm755 "${srcdir}/alterlinux-wallpapers-xfce" "${pkgdir}/usr/share/libalpm/scripts/alterlinux-wallpapers-xfce"
    #install -Dm755 "${srcdir}/alterlinux-wallpapers-lxde" "${pkgdir}/usr/share/libalpm/scripts/alterlinux-wallpapers-lxde"

    # Install hooks
    #local hook
    #for hook in "${srcdir}"/*.hook; do
    #    install -Dm644 "${srcdir}/$(basename ${hook})" "${pkgdir}/usr/share/libalpm/hooks/$(basename ${hook})"
    #done
}
