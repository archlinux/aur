# Maintainer: Pavel Dobiáš <git at paveldobias dot eu>

pkgname=kation-bin
pkgver=0.5.1
_pkgver_rel=1
pkgrel=1
pkgdesc="Unofficial Proton Drive client for KDE Plasma"
arch=('x86_64')
url="https://github.com/hleroy/kation"
license=('GPL-2.0-or-later' 'MIT' 'LGPL-3.0-or-later')
depends=(
    'gcc-libs'
    'glibc'
    'hicolor-icon-theme'
    'qt6-base'
    'kcmutils'
    'kconfig'
    'kcoreaddons'
    'kdbusaddons'
    'ki18n'
    'kio'
    'knotifications'
    'kstatusnotifieritem'
    'kwindowsystem'
    'libsecret'
)
optdepends=(
    'dolphin: protondrive:/, sync emblems and context menu in the file manager'
    'systemsettings: Kation settings in System Settings'
    'kwallet: keyring for the Proton session (or gnome-keyring)'
)
install=$pkgname.install
provides=("kation")
conflicts=("kation")
options=(!debug !strip)
source=("${pkgname}-${pkgver}.tar.zst::${url}/releases/download/v${pkgver}/kation-${pkgver}-${_pkgver_rel}-x86_64.pkg.tar.zst")
sha256sums=('8c1067055ae601655e87ab6ba694679d2fb18ca3054089fcec7a5ec4fb4db6dd')

package() {
    cp -r "${srcdir}/usr" "${pkgdir}/usr"
}
