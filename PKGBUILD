# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.1.1
pkgrel=1
pkgdesc="An enhanced remake of the melonDS core for libretro"
arch=('x86_64' 'aarch64')
url="https://github.com/JesseTG/melonds-ds"
license=('GPL-3.0-or-later')
groups=('libretro')
depends=('libgl' 'libretro-core-info')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source_x86_64=("${_pkgname}_${arch}_${pkgver}.zip::${url}/releases/download/v${pkgver}/melondsds_libretro-linux-${arch}-Release.zip")
source_aarch64=("${_pkgname}_arm64_${pkgver}.zip::${url}/releases/download/v${pkgver}/melondsds_libretro-linux-arm64-Release.zip")
b2sums_x86_64=('1fccc8fc4d7797681daf89397956f03d93ec6a3395b356d28d57f5dda80175fa95df0a0faf5a6bfe8ce428fd7e35f9a4aa6017cadc6574cfc4704a76e4fcdfad')
b2sums_aarch64=('0a330e27b19538d45c697782c3922efd56b5024bebed6f8b0d0161993650bee85012e7794538905fc73a2345a8e46e2addb58ed024471e1b01bfc33bb1b6ae83')

package() {
        _pkg=melondsds_libretro-linux-x86_64-Release
        if [ "${CARCH}" = "aarch64" ]; then
          _pkg=melondsds_libretro-linux-arm64-Release
        fi

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
