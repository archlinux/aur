# Maintainer: JDuch <jduch@pm.me>

pkgname=pulseaudio-virtualmic
pkgver=v0.1
pkgrel=1
pkgdesc="Use any offline or online media file or stream as a PulseAudio source"
arch=('any')
url="https://github.com/MatthiasCoppens/${pkgname}"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg')
makedepends=('git')
optdepends=('coreutils: mktemp not needed when virtualmic is run with -p filename')
source=("git+${url}.git#tag=${pkgver}")
sha512sums=('SKIP')
validpgpkeys=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    echo "$(git describe --tag HEAD)"
}

package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}/virtualmic" "${pkgdir}/usr/bin/"
}
