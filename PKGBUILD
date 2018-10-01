# Maintainer: Jonathan "nekonyuu" Raffre <nk@nyuu.eu>
# Maintainer: Parker Johansen <johansen.parker@gmail.com>
pkgname=inkdrop
_pkgname=inkdrop
pkgver=3.22.1
pkgrel=1
pkgdesc="Note-taking App with Robust Markdown Editor"
arch=('x86_64')
url="https://www.inkdrop.info/"
license=('custom')
depends=('gnome-keyring' 'gconf')
source=(
    'inkdrop.png'
    'inkdrop.desktop'
)
md5sums=(
    '7958b69a1fc0f069fde15b334314c2aa'
    'af55c435a39d56a0b9e6ffe03683d340'
)
source_x86_64=(${_pkgname}-${pkgver}.zip::https://d3ip0rje8grhnl.cloudfront.net/v${pkgver}/Inkdrop-${pkgver}-Linux.zip)
md5sums_x86_64=('5468f7369bd3d522d3539a490eee850c')

package() {
    mkdir -p ${pkgdir}/usr/lib/inkdrop ${pkgdir}/usr/share/pixmaps ${pkgdir}/usr/share/applications ${pkgdir}/usr/bin
    cp ${srcdir}/inkdrop.png ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/inkdrop.desktop ${pkgdir}/usr/share/applications

    rm ${srcdir}/{${_pkgname}-${pkgver}.zip,inkdrop.png,inkdrop.desktop}

    cp -ar ${srcdir}/* $pkgdir/usr/lib/inkdrop
    ln -sf /usr/lib/inkdrop/inkdrop ${pkgdir}/usr/bin/inkdrop
}
