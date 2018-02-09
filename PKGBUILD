# Maintainer: Your Name <jc.francois@gmail.com>
pkgname=beaker-browser-bin
pkgver=0.7.11
pkgrel=2
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
provides=('beaker-browser' 'beakerbrowser')
backup=()

options=(!strip)
source=("https://github.com/beakerbrowser/beaker/releases/download/${pkgver}/beaker-browser-${pkgver}-${arch}.AppImage"
        "beaker-browser.desktop"
        "beaker-browser"
        "beaker.png"
        "LICENSE")
noextract=()
md5sums=('230f726139d12a40f98d078904ea162d'
         '3a79182ba0232d6715b170e92b6e523f'
         '6294b99dbab87ee048a65a202dd05d9b'
         '9cbb1795dc2934472f7c2b021294964d'
         '3862c029863f42c81265a712f9c17c4c')

install='beaker-browser-bin.install'

package() {
    install -Dm644 ${srcdir}/beaker-browser.desktop                     ${pkgdir}/usr/share/applications/beaker-browser.desktop
    install -Dm644 ${srcdir}/beaker.png                                 ${pkgdir}/usr/share/icons/hicolor/48x48/apps/beaker.png
    install -Dm444 ${srcdir}/LICENSE                                    ${pkgdir}/usr/share/LICENSES/beaker-browser/LICENSE
    install -Dm755 ${srcdir}/beaker-browser                             ${pkgdir}/usr/bin/beaker-browser
    install -Dm755 ${srcdir}/beaker-browser-${pkgver}-${arch}.AppImage  ${pkgdir}/opt/beaker-browser/beaker-browser.AppImage
}

# Possible alternative to deleting unwanted files at every run:
# touch /usr/share/appimagekit/no_desktopintegration to prevent installation (but from ALL AppImages)
