# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=beaker-browser-bin
pkgver=0.8.0_prerelease.5
pkgrel=2
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
provides=('beaker-browser' 'beakerbrowser')
backup=()

options=(!strip)
source=("https://github.com/beakerbrowser/beaker/releases/download/${pkgver//_/-}/beaker-browser-${pkgver//_/-}-${arch}.AppImage"
        "beaker-browser.desktop"
        "beaker-browser"
        "beaker.png"
        "LICENSE")
noextract=()
md5sums=('af3d894fdd3397af2722142a45bb5e7e'
         'b10231529d8728fda5cadec2363d1ed1'
         '6294b99dbab87ee048a65a202dd05d9b'
         '9cbb1795dc2934472f7c2b021294964d'
         '3862c029863f42c81265a712f9c17c4c')

install='beaker-browser-bin.install'

package() {
    install -Dm644 ${srcdir}/beaker-browser.desktop                         ${pkgdir}/usr/share/applications/beaker-browser.desktop
    install -Dm644 ${srcdir}/beaker.png                                     ${pkgdir}/usr/share/icons/hicolor/48x48/apps/beaker.png
    install -Dm444 ${srcdir}/LICENSE                                        ${pkgdir}/usr/share/LICENSES/beaker-browser/LICENSE
    install -Dm755 ${srcdir}/beaker-browser                                 ${pkgdir}/usr/bin/beaker-browser
    install -Dm755 ${srcdir}/beaker-browser-${pkgver//_/-}-${arch}.AppImage ${pkgdir}/opt/beaker-browser/beaker-browser.AppImage
}

# Possible alternative to deleting unwanted files at every run:
# touch /usr/share/appimagekit/no_desktopintegration to prevent installation (but from ALL AppImages)
