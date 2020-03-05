# Maintainer: Yang Niao <ksmt 4699 at gmail dot com>
# Contributor: Aoichaan0513 <at Aoichaan0513>
pkgname=flast
pkgver=80.1.0
pkgrel=1
pkgdesc='Cross-platform browser based on Chromium.'
arch=('x86_64')

# Links
channel="Beta"
url='https://github.com/Aoichaan0513/flast'
_url='http://aoichaan0513.xyz/flast/linux/x64/'
source=("${_url}/${channel}/Flast_${pkgver}_amd64.deb")


license=('GPL')
depends=('at-spi2-core' 'desktop-file-utils' 'gtk3' 'hicolor-icon-theme' 'libappindicator-gtk3' 'libnotify' 'libsecret' 'libutil-linux' 'libxss' 'libxtst' 'nss' 'xdg-utils')
md5sums=('17a7386d6f3c5283739df1e5996db96d')

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
