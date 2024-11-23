# Maintainer: Carlo Sala <carlosalag@protonmail.com>
# Contributor: Konstantin Mikhailov <jtraub.devel@gmail.com>

pkgname=lazydocker-bin
_pkgname="${pkgname%-bin}"
pkgver=0.24.1
pkgrel=1
pkgdesc='A simple terminal UI for docker and docker-compose, written in Go with the gocui library.'
url="https://github.com/jesseduffield/${_pkgname}"
license=('MIT')
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('aarch64' 'armv7h' 'i686' 'x86_64')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_x86.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_armv7.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_Linux_arm64.tar.gz")

sha256sums_aarch64=('c38e715f2cb56440bec16e3744005522c1d13c47d2e3730572849dc69cefd8ae')
sha256sums_armv7h=('24bb53f07250184a502d45b649c7c8f6964a8c2c184b2e375688ca37e1a5e474')
sha256sums_i686=('9d69476de56382d6014e101a0c3a34d9dda3ce1f75610b4ff0c7031e3d919b6e')
sha256sums_x86_64=('461cacf618e1020dff1d7896248c1c1f2267d5c25fb529755e4b9c43c5d1d4a5')

package() {
    install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
