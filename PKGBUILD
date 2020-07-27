# Maintainer: Benjamin Böhmke <benjamin at boehmke dot net>
pkgname=emby-theater-bin
pkgver=3.0.12
pkgrel=1
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
sha512sums=("4aac9bde209891eac278f0a7d2a3f8be16014101b57c5669f690a7704d358cf05db545609e2b94e406a3d17b262985e45c8866807ef08971367ea55d87aeedd2"
            "c5ea75bb99bcabb15afc78106c4fbcc340c5e83246f2835e8b71bdc55768a6216b760366ca9e71796ed6e7c2ad5ee591e9e4acd81d77a46a103551787ce2f374")

package(){
    # Extract package data
    tar xf data.tar.xz -C "${pkgdir}"

    install -D -m644 "/usr/lib/emby-theater/resources/app/node_modules/validate-npm-package-license/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m644 "/usr/share/doc/emby-theater/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/COPYRIGHT"
}
