# Maintainer: Akhmad Fauzan <2586ozan@gmail.com>
pkgname=antigravity-ide
pkgver=2.0.1
pkgrel=1
pkgdesc="A powerful and modern Integrated Development Environment for seamless software development"
arch=('x86_64')
url="https://antigravity.google"
license=('LicenseRef-Google-Antigravity')
depends=('gtk3' 'nss' 'alsa-lib' 'libxkbcommon' 'libxdamage' 'cups')
options=(!strip !debug)
provides=('antigravity-ide')
conflicts=('antigravity-ide')

_pkgfilename="Antigravity IDE.tar.gz"
source=("$_pkgfilename::https://edgedl.me.gvt1.com/edgedl/release2/j0qc3/antigravity/stable/2.0.1-4861014005645312/linux-x64/Antigravity%20IDE.tar.gz"
        "antigravity.desktop")

sha256sums=('747163aa3a8afba4b316f97c40b4a75ca4736a59768a416cd1e881e73ec31ef9'
            '4b4659a6b7d9a8c9e6b682476f8d93aeabc8039ae63ef719835d9ac7be35e84f')

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/"{applications,pixmaps}

    cp -r "${srcdir}/Antigravity IDE/"* "${pkgdir}/opt/${pkgname}/"

    ln -s "/opt/${pkgname}/antigravity-ide" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 "${srcdir}/antigravity.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/Antigravity IDE/resources/app/resources/linux/code.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
}
