# Maintainer: Lev Lybin <lev.lybin@gmail.com>

pkgname=upwork
pkgver=4.2.115.0.7
_rawver=${pkgver//./_}
_hashver="n66kq4suk1ud047"
pkgrel=1
pkgdesc="Team App (ex. oDesk)"
arch=('i686' 'x86_64')
url="https://www.upwork.com/downloads/new-team-application"
license=('custom')
conflicts=('upwork-beta' 'upwork-alpha')
depends=('gtk2' 'nss' 'gconf' 'alsa-lib' 'glu' 'libxtst' 'gtkglext' 'libgcrypt15' 'libxss')
install=upwork.install

source=("https://dl.devtrue.net/archlinux/upwork/LICENSE")
md5sums=('56198f3b7f1d0371d89a044c3e110cdd')
md5sums_i686=('23799f56ee51882ce7ffecddf547e3f6')
md5sums_x86_64=('e1e913b7bdd37125db53308066f062e8')
# how to get links Standart, Beta, Alpha: grep "https://updates-desktopapp.upwork.com/binaries" ~/.Upwork/Upwork/Logs/* | tail -n 4
source_x86_64=(upwork_amd64_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}${_hashver}/upwork_amd64.deb)
source_i686=(upwork_i386_${pkgver}.deb::https://updates-desktopapp.upwork.com/binaries/v${_rawver}${_hashver}/upwork_i386.deb)

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cd "${srcdir}"
    cp -rp usr "${pkgdir}/usr"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
