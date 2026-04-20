pkgname=superset-bin
pkgver=desktop-v1.5.6
pkgrel=1
pkgdesc="Code Editor for the AI Agents Era - Run an army of Claude Code, Codex, etc. on your machine"
arch=(x86_64)
url="https://superset.sh"
license=(custom)

depends=(fuse2 hicolor-icon-theme)
options=(!strip !debug)

noextract=("${_appimage}")

_appimage=""

source=("${_appimage}::https://github.com/superset-sh/superset/releases/download/desktop-v1.5.6/superset-1.5.6-x86_64.AppImage")
sha256sums=('207c95cea70cc46380e538f328acaf0a481608951dede40ae4523fb3801b9b2e')

prepare() {
    chmod +x "${_appimage}"
    ./"${_appimage}" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/${_appimage}" \
        "${pkgdir}/opt/${pkgname}/${_appimage}"

    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${_appimage}" "${pkgdir}/usr/bin/"

    cd "${srcdir}/squashfs-root"

    

    
}