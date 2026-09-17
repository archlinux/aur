# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Archisman Panigrahi <apandada1 at gmail dot com>

_basename=vboard

pkgname=${_basename}-bin
pkgdesc="Wayland virtual keyboard for GNU/Linux with modifier key support"

pkgver=2.7.0
pkgrel=1

arch=('any')
license=('GPL-3.0-or-later')
url="https://github.com/archisman-panigrahi/${_basename}"

conflicts=("${_basename}")
provides=("${_basename}")

depends=('glib2' 'gtk3' 'libayatana-appindicator' 'python' 'python-uinput' 'libappindicator' 'python-gobject' 'hicolor-icon-theme')
makedepends=('tar')

source=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}-${pkgrel}_all.deb")
sha256sums=('0f6ddbf118fd6a235673d74f8270ff3025335782ebcdbb293138df32b0f93b7c')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.zst"
}
