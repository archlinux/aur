# Maintainer:tmdp6k mc469617638@outlook.com
pkgname=bilibili-deb-bin
_pkgname=io.github.msojocs.bilibili
pkgver=1.17.9
pkgrel=1
pkgdesc='基于哔哩哔哩官方客户端移植的Linux版本支持漫游(DEB构建相较bilibili-bin更快) '
arch=('x86_64' 'aarch64')
url='https://github.com/msojocs/bilibili-linux/'
license=('MIT License')
depends=(electron ffmpeg libappindicator libinput)
source_x86_64=(https://github.com/msojocs/bilibili-linux/releases/download/v1.17.9-1/${_pkgname}_${pkgver}-1_amd64.deb)
sha256sums_x86_64=('7a4ed7930581afa771ee557dc72ffe4a5e083446d2bb983f59a3c41d4e05187e')
package() {
    cd "$srcdir"
    ar x "${_pkgname}_${pkgver}-1_amd64.deb"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    install -d "${pkgdir}/opt/apps"
    install -d "${pkgdir}/usr/share/"
}