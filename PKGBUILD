# Maintainer: Parker Johansen <johansen.parker@gmail.com>
# Contributor: Jonathan "nekonyuu" Raffre <nk@nyuu.eu>
pkgname=inkdrop
_pkgname=inkdrop
pkgver=5.5.3
pkgrel=1
pkgdesc="The Note-taking App with Robust Markdown Editor"
arch=('x86_64')
url="https://www.inkdrop.app/"
license=('custom')
depends=('gnome-keyring' 'gtk3' 'libsecret' 'libxss' 'nss')
optdepends=('python' 'node')

source=(
    'inkdrop.png'
    'inkdrop.desktop'
)
md5sums=(
    'f9c4790ca2e4463da42369533fe03781'
    'a7a5d6324a17a99cc09a58141cacd4b7'
)
source_x86_64=(${_pkgname}-${pkgver}.zip::https://d3ip0rje8grhnl.cloudfront.net/v${pkgver}/Inkdrop-${pkgver}-Linux.zip)
md5sums_x86_64=('8fd097865c8d9adc7ba13afc61d25a20')

package() {
    mkdir -p ${pkgdir}/usr/lib/inkdrop ${pkgdir}/usr/share/pixmaps ${pkgdir}/usr/share/applications ${pkgdir}/usr/bin
    cp ${srcdir}/inkdrop.png ${pkgdir}/usr/share/pixmaps
    cp ${srcdir}/inkdrop.desktop ${pkgdir}/usr/share/applications

    rm ${srcdir}/{${_pkgname}-${pkgver}.zip,inkdrop.png,inkdrop.desktop}

    cp -ar ${srcdir}/* $pkgdir/usr/lib/inkdrop
    ln -sf /usr/lib/inkdrop/inkdrop ${pkgdir}/usr/bin/inkdrop
}
