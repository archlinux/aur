# Maintainer: Zion Nimchuk <zionnimchuk@gmail.com>
pkgname=trex-bin
provides=('trex')
conflicts=('trex')
_cudaver=11.1
pkgver=0.19.14
pkgrel=1
pkgdesc="T-Rex is a versatile cryptocurrency mining software for NVIDIA hardware. It supports a variety of algorithms and is trying to do its best to make it as fast and as convenient to use as possible."
arch=('x86_64')
license=('custom')
url="https://github.com/trexminer/T-Rex"
options=('!strip')
depends=('nvidia-utils')
source=("t-rex_${pkgver}_${_cudaver}.tar.gz"::"https://github.com/trexminer/T-Rex/releases/download/0.19.14/t-rex-${pkgver}-linux-cuda${_cudaver}.tar.gz")
sha512sums=('3b310637bc3799feaf42210e0133dde3f82398d614ce272a065b7f2784ca0ea7f83e35b422399079b43f3631e4cda981eaa2f15d934df3e7837e9c662571d75d')

package() {
    cd "${srcdir}"
    install -Dm755 "${srcdir}/t-rex" "${pkgdir}/usr/bin/t-rex"
}
