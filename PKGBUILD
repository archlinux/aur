# Maintainer: Jason Parrott <parrott.jason@gmail.com>

pkgname=gitter
pkgver=2.3.2
pkgrel=3
pkgdesc='Where developers come to talk'
url='https://gitter.im'
license=('unknown')
arch=('x86_64')
depends=('libsystemd' 'desktop-file-utils')
makedepends=('tar')
source=("https://update.gitter.im/linux64/${pkgname}_${pkgver}_amd64.deb")
noextract=("${pkgname}_${pkgver}_amd64.deb")
install='gitter.install'
md5sums=('6075db7556ac9b2054325349cf477444')

options=(!strip)

prepare() {
    cd "${srcdir}"
    ar x "${pkgname}_${pkgver}_amd64.deb"
}

package() {
    cd "${srcdir}"
    tar -C "${pkgdir}" -xf data.tar.gz
}
