# Maintainer : tadly <me@tadly.de>

pkgname=parsec-bin
pkgver=150_86e
pkgrel=1
pkgdesc='Remotely connect to a gaming pc for a low latency remote computing experience'
url='http://parsec.app'
license=('custom')
arch=('x86_64')
arch=('x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
provides=('parsec')
depends=('gcc-libs' 'libglvnd' 'libxext' 'libxcb' 'ffmpeg4.4')
optdepends=('libva: For hardware accelerated decoding')

source_x86_64=("$pkgname-$pkgver.deb::https://builds.parsecgaming.com/package/parsec-linux.deb")
sha256sums_x86_64=('c30072f3a4ddac7687f626b8d32876e327791bce164d74448a147ef48ea8eae5')

#source_arm=("$pkgname-$pkgver.deb::https://builds.parsecgaming.com/package/parsec-rpi.deb")
#sha256sums_arm=('a98e840dc44f4762018895bd0da704c88887815de0e74e0f39aa7737f5b0e802')
#
#source_armv6h=($source_arm)
#sha256sums_armv6h=($sha256sums_arm)
#
#source_armv7h=($source_arm)
#sha256sums_armv7h=($sha256sums_arm)
#
#source_aarch64=($source_arm)
#sha256sums_aarch64=($sha256sums_arm)

options=('!strip')

package() {
    tar xf "${srcdir}/data.tar.xz" -C "${pkgdir}"
    chmod 755 "${pkgdir}/usr/"
}
