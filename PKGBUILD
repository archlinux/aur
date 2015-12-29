# Maintainer Jordan Klassen <forivall at gmail dot com>

# Based on atom-editor-bin
# Maintainer Danny Arnold <despair.blue at gmail dot com>
# Contributor: Andre Miranda <andreldm1989 AT gmail DOT com>
# Contributor: Tom Bu <tom.bu AT members.fsf.org>
# Contributor: John Reese <john@noswap.com>
# Upstream URL: https://github.com/atom/atom

pkgname=atom-editor-beta-bin
_ver=1.4.0
_beta=beta3
pkgver="${_ver}.${_beta}"
pkgrel=1
pkgdesc="Chrome-based text editor from Github - Beta Channel - Precompiled binary from official repository"
arch=('x86_64')
url="https://github.com/atom/atom"
license=('MIT')
options=(!strip)
depends=('git' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'python2' 'xdg-utils' 'desktop-file-utils' 'alsa-lib' 'libgnome-keyring')
optdepends=('gvfs')
conflicts=('atom-editor-beta')
install=$pkgname.install

md5sums=('c2d497ffd7c30726e5dcc070bdee18e8'
         'bec6d0ab5edca667f726dd84540626aa')
source=("atom-amd64-v${_ver}-${_beta}.deb::https://github.com/atom/atom/releases/download/v${_ver}-${_beta}/atom-amd64.deb"
         atom-python.patch)

package() {
  bsdtar xf data.tar.gz
  patch -p1 < "${srcdir}"/atom-python.patch
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
