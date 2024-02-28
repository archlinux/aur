# Maintainer: Jat <chat@jat.email>

pkgname=obs-ndi-bin
pkgver=4.13.1
pkgrel=1
pkgdesc='NewTek NDI integration for OBS Studio.'
arch=('x86_64')
license=('GPL2')
url='https://github.com/obs-ndi/obs-ndi'
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'ndi-sdk')
source=("${url}/releases/download/${pkgver}/obs-ndi-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('5436f823f8886f4c57ea5fe538905ea322add5185a812896afd9a3369628e4dd')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
