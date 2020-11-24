# Maintainer: JDuch <jduch@pm.me>

pkgname=pulseaudio-virtualmic
pkgver=0.1
pkgrel=1
pkgdesc="Use any offline or online media file or stream as a PulseAudio source"
arch=('any')
url="https://github.com/MatthiasCoppens/${pkgname}"
license=('GPL3')
depends=('pulseaudio' 'ffmpeg')
makedepends=('git')
optdepends=('coreutils: mktemp not needed when virtualmic is run with -p filename')
source=("git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"

    git describe --tags | sed 's/^v//;s/-/+/g'
}

package() {
    mkdir "${pkgdir}/usr"
    mkdir "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${pkgname}/virtualmic" "${pkgdir}/usr/bin/"
}
