# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=halloy-bin
_pkgname="${pkgname/-bin}"
pkgver=2024.4
pkgrel=1
pkgdesc='An open-source IRC client written in Rust, with the Iced GUI library'
arch=('x86_64')
url='https://github.com/squidowl/halloy'
license=('GPL-3.0-or-later')
depends=('openssl' 'glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('halloy')
conflicts=('halloy')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux.tar.gz"
        "icons.tar.zst")
sha256sums=('2e830be4eb17aefe5bd8ea4a3db9b18cf01d4bbd9e5800c5b762d2c5ab79beed'
            'db9444bfda1d7429168495b86a5ba161b87a465401278f54b9d58de64bdabc7a')

package() {
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "org.squidowl.${_pkgname}.appdata.xml" -t "${pkgdir}/usr/share/appdata/metainfo"
    install -Dm644 "org.squidowl.${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    cp -r "icons" "${pkgdir}/usr/share"
}
