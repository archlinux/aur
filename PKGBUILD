Maintainer: RonGus <rongus760@gmail.com>
pkgname=jentlememes-launcher-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='JentleMemes Minecraft launcher (prebuilt pacman package from upstream releases)'
arch=('x86_64')
url='https://github.com/rongus760-ship-it/JentleMemes-Launcher'
license=('Apache-2.0' 'MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libayatana-appindicator' 'gdk-pixbuf2' 'openssl' 'hicolor-icon-theme')
provides=('jentlememes-launcher')
conflicts=('jentlememes-launcher')
options=('!strip')
_upstream_pkgrel=1
_upstream_pkg="jentlememes-launcher-bin-${pkgver}-${_upstream_pkgrel}-x86_64.pkg.tar.zst"
source=("${_upstream_pkg}::${url}/releases/download/v${pkgver}/${_upstream_pkg}")
sha256sums=('SKIP')

package() {
  bsdtar -xf "${srcdir}/${_upstream_pkg}" -C "${pkgdir}" usr
  bsdtar -xf "${srcdir}/${_upstream_pkg}" -C "${pkgdir}" opt 2>/dev/null || true
}
