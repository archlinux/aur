# Maintainer: Yevhen Hurynovych <support@stfalcon.com>
# Contributor: Alexander Hrinchuk <agrynchuk@gmail.com>

pkgbase='ukrainealarm-client'
pkgname="${pkgbase}-bin"
pkgver=0.2.0
pkgrel=0
pkgdesc="Linux client for receiving alarms in Ukraine (see https://www.ukrainealarm.com/). It's allows plays sounds like in Android app and execute custom script on alarms evenents."
arch=('x86_64')
install=ukrainealarm-client.install
_arch='amd64'
_pkgver="${pkgver}-0~bullseye0"
url="https://www.ukrainealarm.com/linux-app"
license=('custom')
depends=(
    'alsa-lib'
    'glibc'
)
optdepends=('libpulse: A featureful, general-purpose sound server.')
provides=(${pkgbase})
conflicts=(${pkgbase})
source=(
    https://apt.ukrainealarm.com/pool/main/u/${pkgbase}/${pkgbase}_${_pkgver}_${_arch}.deb
)
sha256sums=('482b648bafd5ff4753aa67acd61feff2ae08dce212db98638fce94a29b049f4b')
package() {
    tar xf data.tar.xz -C "${pkgdir}"
    install -d "${pkgdir}/usr/lib/systemd/system"
    mv "${pkgdir}/lib/systemd/system/${pkgbase}.service" "${pkgdir}/usr/lib/systemd/system/"
    rm -Rf "${pkgdir}/lib"
}

