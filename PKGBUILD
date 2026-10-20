# Maintainer: Stokes
pkgname=quicklook-bin
pkgver=0.4.0
pkgrel=1
pkgdesc='Quick Look image, document and folder preview for KDE Plasma 6 with optional soft blur (prebuilt)'
arch=('x86_64')
url='https://github.com/13Stokes31/quicklook'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later')
depends=('glibc>=2.39' 'gcc-libs' 'qt6-base>=6.12' 'qt6-wayland' 'kwindowsystem' 'libglvnd')
optdepends=('dolphin: file manager service menu and Space shortcut (26.04+)'
            'qt6-webengine: optional PDF and Office preview module'
            'libreoffice: optional ODT/DOC/DOCX/ODS/XLS/XLSX preview via PDF'
            'kwin: window centering and blur (soft module requires 6.7.5)'
            'qt6-declarative>=6.12: optional KWin soft blur module'
            'libepoxy: optional KWin soft blur module'
            'python: optional quicklook-dolphin-shortcut command')
provides=("quicklook=$pkgver")
conflicts=('quicklook')
options=('!debug' '!strip')
install=quicklook.install
source=("$url/releases/download/v$pkgver/quicklook-$pkgver-linux-x86_64.tar.gz")
sha256sums=('9e0b1c77af0422fe1ea1833a551c86c7cd75ef83066c429637f4e28a678b47d4')

package() {
  cd "quicklook-$pkgver-linux-x86_64"
  cp -r --preserve=mode,timestamps usr "$pkgdir/"
}
