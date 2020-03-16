# Maintainer: Parker Johansen <johansen.parker@gmail.com>
# Contributor: Jonathan "nekonyuu" Raffre <nk@nyuu.eu>
pkgname=inkdrop
_pkgname=inkdrop
pkgver=4.6.0
pkgrel=1
pkgdesc="Note-taking App with Robust Markdown Editor"
arch=('x86_64')
url="https://www.inkdrop.info/"
license=('custom')
depends=('gnome-keyring' 'gtk3' 'libsecret' 'libxss' 'nss')
optdepends=('python' 'node')

source=(
    'inkdrop.png'
    'inkdrop.desktop'
)
md5sums=(
    'f9c4790ca2e4463da42369533fe03781'
    'af55c435a39d56a0b9e6ffe03683d340'
)
source_x86_64=(${_pkgname}-${pkgver}.zip::https://d3ip0rje8grhnl.cloudfront.net/v${pkgver}/Inkdrop-${pkgver}-Linux.zip)
md5sums_x86_64=('6321ad6d594f454231a206205b0f4fe5')

package() {
    mkdir -p ${pkgdir}/usr/lib/inkdrop ${pkgdir}/usr/share/pixmaps ${pkgdir}/usr/share/applications ${pkgdir}/usr/bin
    cp ${srcdir}/inkdrop.png ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/inkdrop.desktop ${pkgdir}/usr/share/applications

    rm ${srcdir}/{${_pkgname}-${pkgver}.zip,inkdrop.png,inkdrop.desktop}

    cp -ar ${srcdir}/* $pkgdir/usr/lib/inkdrop
    ln -sf /usr/lib/inkdrop/inkdrop ${pkgdir}/usr/bin/inkdrop
}
