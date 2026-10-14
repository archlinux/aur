# Maintainer: Stokes
pkgname=quicklook-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='Quick Look image preview for KDE Plasma 6 with optional soft blur (prebuilt)'
arch=('x86_64')
url='https://github.com/13Stokes31/quicklook'
license=('GPL-3.0-or-later' 'GPL-2.0-or-later')
depends=('glibc>=2.39' 'gcc-libs' 'qt6-base>=6.12' 'qt6-wayland' 'kwindowsystem' 'libglvnd')
optdepends=('dolphin: file manager service menu and Space shortcut (26.04+)'
            'kwin: window centering and blur (soft module requires 6.7.5)'
            'qt6-declarative>=6.12: optional KWin soft blur module'
            'libepoxy: optional KWin soft blur module'
            'python: optional quicklook-dolphin-shortcut command')
provides=("quicklook=$pkgver")
conflicts=('quicklook')
options=('!debug' '!strip')
install=quicklook.install
source=("$url/releases/download/v$pkgver/quicklook-$pkgver-linux-x86_64.tar.gz")
sha256sums=('b2b176a5d5a2a9ba312ec60a536831cbda03b7a784eddc9dd047754060b00651')

package() {
  cd "quicklook-$pkgver-linux-x86_64"
  cp -r --preserve=mode,timestamps usr "$pkgdir/"
}
