pkgname=loalogs
pkgver=1.49.0
pkgrel=1
pkgdesc="Lost Ark DPS meter"
arch=('x86_64')
url="https://github.com/snoww/loa-logs"
options=(!strip)
license=('GPL-3.0-only')
depends=('bash' 'glibc')
source=(
    "LOA.Logs_${pkgver}_amd64.AppImage::https://github.com/snoww/loa-logs/releases/download/v${pkgver}/LOA.Logs_${pkgver}_amd64.AppImage"
    "nineveh_${pkgver}::https://github.com/snoww/loa-logs/releases/download/v${pkgver}/nineveh"
    "start_logs.sh"
    "nineveh_wrapper.sh"
    "icon.png"
    "loalogs.desktop"
)
sha256sums=('5206cf669c1758b4ff299487f5589d8c9677c7b996377c92006be89333697435'
            '16c303ea6f1a34644f847686c1e04db2e73ec003e9cf49d92b3085f01817eb0f'
            'c0de9112d19404661b189da41facf6bdc6d6a3f41347091fa70605d9d2133106'
            '92602a2a729e16097db2add01947aefa413d021cf0b2520a50aa1f4288ee22d9'
            'e7ff8fce866d741c5ad78cd46f8b1c2686eb6ffa622bc46c1cf7709b4ca2f974'
            '3485f4a5378544bb63d95fa845a9d477ade7f3d626f8ad2f79d96a15bfc57f08')

package() {
    install -dm755 "${pkgdir}/opt/loalogs"

    install -Dm755 "${srcdir}/LOA.Logs_${pkgver}_amd64.AppImage" "${pkgdir}/opt/loalogs/loalogs.appimage"
    install -Dm755 "${srcdir}/nineveh_${pkgver}" "${pkgdir}/opt/loalogs/nineveh"
    install -Dm755 "${srcdir}/start_logs.sh" "${pkgdir}/opt/loalogs/start_logs.sh"
    install -Dm755 "${srcdir}/nineveh_wrapper.sh" "${pkgdir}/opt/loalogs/nineveh_wrapper.sh"
    install -Dm644 "${srcdir}/icon.png" "${pkgdir}/opt/loalogs/icon.png"

    install -Dm644 "${srcdir}/loalogs.desktop" "${pkgdir}/usr/share/applications/loalogs.desktop"
}
