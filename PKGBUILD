# Maintainer: Yamada Hayao <hayao@fascode.net>

pkgname=metrogit-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Native desktop git client that integrates with JIRA and other tools.'
arch=('x86_64')
url='https://github.com/Yamazaki93/MetroGit'
source=("${url}/releases/download/v${pkgver}/metrogit_${pkgver}_amd64.deb")
license=('MIT')
depends=('pkgconf' 'gconf' 'libnotify' 'libappindicator-gtk2' "libappindicator-gtk3" "libxtst" "libnss_nis" "libxss")
md5sums=('44870d7637e165fb5a799c546c0f8e64')

prepare() {
    tar -xvf data.tar.xz
}

package() {
    cp -r ${srcdir}/opt ${pkgdir}/opt
    cp -r ${srcdir}/usr ${pkgdir}/usr
    chmod -R 755 ${pkgdir}/*
    mkdir -p "${pkgdir}/usr/bin"
    touch ${pkgdir}/usr/bin/metrogit
    ln -sf "${pkgdir}/opt/MetroGit/metrogit" "${pkgdir}/usr/bin/metrogit"
}
