# Maintainer: Jat <chat@jat.email>

_pkgname='distroav'
pkgname="${_pkgname}-bin"
pkgver=6.0.0
pkgrel=1
pkgdesc='NewTek NDI integration for OBS Studio.'
arch=('x86_64')
license=('GPL2')
url='https://github.com/DistroAV/DistroAV'
provides=("${_pkgname}" 'obs-ndi')
conflicts=("${_pkgname}-git" 'obs-ndi-git')
depends=('obs-studio' 'avahi' 'ndi-sdk')
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('35fbb314adcd2c38681a88bd1230e18860f6f1092f163b779cc140b9560578b2')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
