# Maintainer: Plague-doctor <plague at privacyrequired dot com>
# Maintainer: KUHTOXO https://aur.archlinux.org/account/kuhtoxo

pkgname=xeoma-client-bin
pkgver=25.11.10
pkgrel=1
pkgdesc='Xeoma Client - the video surveillance software.'
arch=('x86_64')
url='https://felenasoft.com/xeoma/en/'
license=('custom:xeoma')
_shortname=xeoma-client
_appfile=xeoma.app
_apppkg=$pkgname-$pkgver-$pkgrel.tgz
#depends=('hicolor-icon-theme' 'glu<=9.0.1')
depends=('hicolor-icon-theme')
options=(!strip)
source=(
        "${_apppkg}::https://felenasoft.com/xeoma/downloads/latest/linux/xeoma_linux64.tgz"
        "xeoma-client.png"
        "xeoma-client.desktop"
        "LICENSE"
)
sha256sums=('f2d5e572a313a40b39deb34091ccd382909379a0079ad7141fde8a5785426865'
            'bd0ab0967b483b6d10fbeff18d7e1bd023ce477b8809a586d89741da34a0cffc'
            '1ae7f611c6261b8034974081e42bf2fdee3e5ba47afc7364e2ee8e9b5ef8910e'
            'c76a128f1662d5ca08693dd84e7da892942eaa3d61c0935188a9d32a5e755dfb')

package() {
    # Create Directories
    install -d "${pkgdir}/usr/bin"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 xeoma-client.png "${pkgdir}/usr/share/icons/hicolor/256x256/apps/xeoma-client.png"
    install -Dm644 xeoma-client.desktop "${pkgdir}/usr/share/applications/$_shortname.desktop"
    install -Dm755 "${srcdir}/$_appfile" "${pkgdir}/opt/${_shortname}/${_shortname}.app"

    # Symlink Xeoma
    ln -s "/opt/${_shortname}/${_shortname}.app" "${pkgdir}/usr/bin/${_shortname}"
}

