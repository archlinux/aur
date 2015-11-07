# Maintainer Jordan Klassen <forivall at gmail dot com>

# Based on atom-editor-bin
# Maintainer Danny Arnold <despair.blue at gmail dot com>
# Contributor: Andre Miranda <andreldm1989 AT gmail DOT com>
# Contributor: Tom Bu <tom.bu AT members.fsf.org>
# Contributor: John Reese <john@noswap.com>
# Upstream URL: https://github.com/atom/atom

pkgname=atom-editor-beta-bin
_ver=1.2.0
_beta=beta1
pkgver="${_ver}.${_beta}"
pkgrel=1
pkgdesc="Chrome-based text editor from Github - Beta Channel - Precompiled binary from official repository"
arch=('x86_64')
url="https://github.com/atom/atom"
license=('MIT')
options=(!strip)
depends=('git' 'gconf' 'gtk2' 'libnotify' 'libxtst' 'nss' 'python2' 'gvfs' 'xdg-utils' 'desktop-file-utils')
conflicts=('atom-editor-beta')
install=$pkgname.install

md5sums=('0ba4384aedda54b4f544011cd8df4acb'
         '8ed449a6d7d7aff30d8208135a11d9dc')
source=("atom-amd64-v${_ver}-${_beta}.deb::https://github.com/atom/atom/releases/download/v${_ver}-${_beta}/atom-amd64.deb"
         atom-python.patch)

package() {
  bsdtar xf data.tar.gz
  patch -p1 < "${srcdir}"/atom-python.patch
  chmod -R g-w usr
  mv usr "${pkgdir}"
}
