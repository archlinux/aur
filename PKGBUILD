# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgname=sunflower
pkgname=${_pkgname}-bin
_pkgver=0.5-63
pkgver=${_pkgver//-/.}
_pkgrel=1
pkgrel=${_pkgrel}
pkgdesc="Small and highly customizable twin-panel file manager for Linux with support for plugins"
arch=('any')
url="https://sunflower-fm.org/"
license=('GPL3')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
makedepends=('tar')
depends=('gtk3' 'vte3' 'python' 'python-gobject' 'python-chardet' 'python-cairo' 'librsvg')
optdepends=('libnotify'
            'python-mutagen: audio-metadata support'
            'gvfs: mount-management')
source=("https://github.com/MeanEYE/Sunflower/releases/download/${_pkgver}/${_pkgname}-${pkgver}-${_pkgrel}.all.deb")
sha256sums=('686bb28a0e35fa0f07cd8906b11d215e3a57dd172c36c1bd1005784712babf96')

package() {
    cd "${pkgdir}"

    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.xz"

    mkdir -p "${pkgdir}/usr/lib/python3.13/"
    mv "${pkgdir}/usr/lib/python3/dist-packages" "${pkgdir}/usr/lib/python3.13/site-packages"
    rm -rf "${pkgdir}/usr/lib/python3/"
} 
