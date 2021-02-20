# Maintainer:  Daniel Goncalves <daniel.dias.g @ gmail.com>

pkgname=mindomo-bin
pkgver=9.5.4
pkgrel=1
pkgdesc="Mindomo is an online collaborative mind mapping, concept mapping and outlining software for visualizing and organizing information."
arch=('x86_64')
url="https://www.mindomo.com"
license=('custom:mindomo')
provides=('mindomo')

source_x86_64=('https://www.mindomo.com/download/9.5/Mindomo_v.9.5.4_x64.AppImage')

sha256sums_x86_64=('4f3ec3fdaa502b4d726b68f90d0c2977c1c360414704e81a9e201ed1d4dea83f')

package() {
    # bin -> opt
    install -d "${pkgdir}"{/opt/$pkgname,/usr/bin}

    cp -r "${srcdir}/Mindomo_v.9.5.4_x64.AppImage" "${pkgdir}/opt/${pkgname}/Mindomo_v.9.5.4_x64.AppImage"
    chmod -R 755 "${pkgdir}/opt/${pkgname}/"

    # symlink
    ln -s "${pkgdir}/opt/${pkgname}/Mindomo_v.9.5.4_x64.AppImage" "${pkgdir}/usr/bin/mindomo"
	chmod +x "${pkgdir}/usr/bin/mindomo"

}
