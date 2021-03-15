# Maintainer: Benjamin Böhmke <benjamin at boehmke dot net>
pkgname=emby-theater-bin
pkgver=3.0.14
pkgrel=2
pkgdesc='An Electron app for Emby'
license=('GPL2')
arch=('x86_64')
url=https://github.com/MediaBrowser/emby-theater-electron
provides=("emby-theater")
conflicts=("emby-theater")

depends=("gtk3"
         "libnotify"
         "libnss_nis"
         "libxss"
         "libxtst"
         "xdg-utils"
         "libutil-linux"
         "glib2"
         "gvfs"
         "gvfs-smb"
         "gvfs-nfs")

source=("https://github.com/MediaBrowser/emby-theater-electron/releases/download/${pkgver}/emby-theater_${pkgver}_amd64.deb"
        "emby-theater.install")
sha512sums=("57fd7ae4d1ff3f41c6ee0b5d60c97625583f287ac8a7440607bd0838596a62d156585775d4f54b10b5559329448eaa78c7b2c3a7dd996514a4890ed4a1ef1caf"
            "c5ea75bb99bcabb15afc78106c4fbcc340c5e83246f2835e8b71bdc55768a6216b760366ca9e71796ed6e7c2ad5ee591e9e4acd81d77a46a103551787ce2f374")

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "${pkgdir}/usr/lib/emby-theater/resources/app/node_modules/validate-npm-package-license/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "${pkgdir}/usr/share/doc/emby-theater/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
