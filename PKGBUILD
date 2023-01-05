# Maintainer: Yevhen Hurynovych <support@stfalcon.com>
# Contributor: Alexander Hrinchuk <agrynchuk@gmail.com>

pkgbase='ukrainealarm-client-gui'
pkgname="${pkgbase}-bin"
pkgver=0.1.1
pkgrel=0
pkgdesc="Linux client for receiving alarms in Ukraine (see https://www.ukrainealarm.com/). GUI package."
arch=('x86_64')
_arch='amd64'
_pkgver="${pkgver}-0~bullseye0"
url="https://www.ukrainealarm.com/linux-app"
license=('custom')
depends=(
    'libxext'
    'libxcb'
    'libxau'
    'libxdmcp'
    'glibc'
)
optdepends=('libpulse: A featureful, general-purpose sound server.')
provides=(${pkgbase})
conflicts=(${pkgbase})
source=(
    https://apt.ukrainealarm.com/pool/main/u/${pkgbase}/${pkgbase}_${_pkgver}_${_arch}.deb
)
sha256sums=('7a30db5beb07abf7432abc975d9e5ba97b3227daf6c431da3f07841633872f2b')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    rm -f ${pkgdir}/usr/share/doc/ukrainealarm-client-gui/changelog.Debian.gz
}

