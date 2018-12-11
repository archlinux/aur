# Maintainer: Lev Lybin <lev.lybin at gmail dot com>
# Maintainer: Maksym Sheremet <msheremet at sheremets dot com>

pkgname=upwork
pkgver=5.1.0.647
_rawver=${pkgver//./_}
_hashver="g0nxmj7uab8q069t"
pkgrel=1
pkgdesc="Desktop App 64-bit Standard version"
arch=('x86_64')
url="https://www.upwork.com/downloads?source=Footer"
license=('custom')
conflicts=('upwork-alpha')
depends=('alsa-lib' 'gconf' 'gdk-pixbuf2' 'gtk2' 'libxss' 'libxtst' 'nss')
install=upwork.install
source=("LICENSE")
md5sums=('bb535c74d4673cee6437b04d33b32138')
md5sums_x86_64=('5ff7848a1c95f60fd4ba31b0c3f8de86')
# how to get links Prod, Beta, Alpha: grep "_getVersionToDownload" ~/.Upwork/Upwork/Logs/* | tail -n 1
source_x86_64=(https://updates-desktopapp.upwork.com/binaries/v${_rawver}_${_hashver}/upwork_${pkgver}_amd64.deb)

prepare() {
    cd "${srcdir}"
    tar -xJf "${srcdir}/data.tar.xz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
