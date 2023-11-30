# Maintainer: Jat <chat@jat.email>

pkgname=obs-ndi-bin
pkgver=4.13.0
pkgrel=1
pkgdesc='NewTek NDI integration for OBS Studio.'
arch=('x86_64')
license=('GPL2')
url='https://github.com/obs-ndi/obs-ndi'
provides=('obs-ndi')
conflicts=('obs-ndi-git')
depends=('obs-studio' 'avahi' 'ndi-sdk')
source=("${url}/releases/download/${pkgver}/obs-ndi-${pkgver}-x86_64-linux-gnu.deb")
sha256sums=('d7d039d5361bf7b072f9b9649066b356664fd7712cc9d6bffce5dfd7bf062efb')

package() {
    cd "${srcdir}" || exit
    tar -xf data.tar.gz -C "${pkgdir}"

    cd "${pkgdir}" || exit
    mv usr/lib/x86_64-linux-gnu/obs-plugins usr/lib
    rm -r usr/lib/x86_64-linux-gnu
}
