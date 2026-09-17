# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_basename=OneKeePass
pkgname=${_basename,,}-bin
pkgver=0.26.0
pkgrel=1
pkgdesc="A secure password manager for macOS,Linux and Windows platforms"
arch=('x86_64')
url="https://github.com/OneKeePass/desktop"
license=('GPL-3.0-only')
conflicts=("${_basename,,}")
provides=("${_basename}")
makedepends=('tar')
depends=('libsoup3' 'pango' 'glib2' 'zlib' 'gtk3' 'gdk-pixbuf2' 'cairo' 'gcc-libs' 'webkit2gtk-4.1' 'glibc' 'hicolor-icon-theme')
source_x86_64=("${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_linux_${arch[0]}.deb")
sha256sums_x86_64=('4ebda8c78fca8521240c0a54e3dec23ec9902a6598fdb1d9c0834c764d494b0a')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar -xf "${srcdir}/data.tar.gz"
} 
