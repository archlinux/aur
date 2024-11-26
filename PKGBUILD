# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.1.8
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
b2sums_x86_64=('acebae093912db1e8d8384a304b7b5ea0beb30623828088dd89a0e8ed802cb80a44aedc56ee58b45b3ae237322b0a8c4ad4b03a9fd8cda2c45f119df97ec0549')
b2sums_aarch64=('5116cfdffaecfd9618e00c3fd812e8b1f6b090b9633d040e3f74f50bbb9248934e274e2a42fa9128adf9ba01641b0beb8bd6f3c8cfd4f70ab4a7e884aa9defe8')

package() {
        _pkg=melondsds_libretro-linux-x86_64-Release
        if [ "${CARCH}" = "aarch64" ]; then
          _pkg=melondsds_libretro-linux-arm64-Release
        fi

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
