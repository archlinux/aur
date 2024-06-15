# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.1.3
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
b2sums_x86_64=('90a7fc979b5bec76c86f3b0d4405075311be774f6e7bc4a9a185601f008dc65c6145e395dc231862e10de348b8efaaab6f8b99d57a795312d7cea43b28bb1837')
b2sums_aarch64=('8c0fab52a35336ee5e4b343060a03961f78f0974d19aeb52e76aa51b811964ed09c2dceeaa1c54a7673b959fc433d50ae797806351188337d7f27bb3e4d42a8c')

package() {
        _pkg=melondsds_libretro-linux-x86_64-Release
        if [ "${CARCH}" = "aarch64" ]; then
          _pkg=melondsds_libretro-linux-arm64-Release
        fi

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
