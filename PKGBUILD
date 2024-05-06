# Maintainer: Jat <chat@jat.email>

pkgname=obs-ndi-bin
pkgver=4.13.2
pkgrel=1
pkgdesc='NewTek NDI integration for OBS Studio.'
arch=('x86_64')
license=('GPL2')
url='https://github.com/obs-ndi/obs-ndi'
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'ndi-sdk')
source=("${url}/releases/download/${pkgver}/obs-ndi-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('d40f5506432b43d3fdffad5d4b62cec84e997ab39ca48647b288164f9d4e2b3a')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
