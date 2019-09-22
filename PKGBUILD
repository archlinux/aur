# Maintainer: Yang Niao <ksmt 4699 at gmail dot com>
# Contributor: Aoichaan0513 <at Aoichaan0513>
pkgname=flast
pkgver=4.8.3
pkgrel=1
pkgdesc='Cross-platform browser based on Chromium.'
arch=('x86_64')
url='https://gitlab.com/Aoichaan0513/flast'
license=('GPL')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libutil-linux' 'libxss' 'libxtst' 'nss' 'xdg-utils')
source=(
    "http://aoichaan0513.xyz/flast/linux/x64/Stable/Flast_${pkgver}_amd64.deb"
)
md5sums=('5be3aa5d6bd829a9f79621cad64d5eb3')

prepare() {
    tar -xvf data.tar.xz
}

package() {
    cp -r ${srcdir}/opt ${pkgdir}/opt
    cp -r ${srcdir}/usr ${pkgdir}/usr
    chmod -R 755 ${pkgdir}/*
    mkdir -p "${pkgdir}/usr/bin"
    touch ${pkgdir}/usr/bin/flast
    ln -sf "${pkgdir}/opt/Flast/flast" "${pkgdir}/usr/bin/flast"
}
