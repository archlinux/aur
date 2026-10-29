# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=backslash-app
_basename=backslash
pkgname=${_basename}-bin
pkgver=0.6.1
pkgrel=1
pkgdesc="A lightning-fast command launcher that helps you launch commands, run apps, and streamline your workflow—all while embracing the quirky spirit of Linux!"

arch=('x86_64')
license=('MIT')
url="https://github.com/backslash-app/backslash"

conflicts=("${_basename}")
provides=("${_basename}")

makedepends=('tar')
depends=('glibc' 'libgcc' 'gtk4' 'glib2' 'python' 'gdk-pixbuf2' 'pango' 'graphene' 'hicolor-icon-theme')
optdepends=('perl: Fetching stock market info for the emStocks plugin'
            'htmldoc: Rendering HTML documents')

options=('!strip' '!debug')

source_x86_64=("https://github.com/${_author}/${_basename}/releases/download/v${pkgver}/${_basename}_${pkgver}_amd64.deb")
sha256sums_x86_64=('d3846b7bf2a29be76d98ac4a67662677b440ce130f41f89d4fe7c81a26acd919')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.gz"

    # licence
    mv "${pkgdir}/usr/share/licenses/${_basename}" "${pkgdir}/usr/share/licenses/${pkgname}"
} 
