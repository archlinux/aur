# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.2.0
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
b2sums_x86_64=('cbc39b91ab83f1ca02d974c429e4ceaaa747b707a3d0acd4151b8d406d9f36f694d5f1a8ebb449da57e7236ac34e879329f72ba684d5c25a984162d8cf0d866d')
b2sums_aarch64=('3e620a65909535477d78d2ef090913de8cd6054e7859eed37e2ba68e53a63217cb23c16c4b4f02332d57537b71dd8b66ac1bff4fada81841b4f1c8ae400204de')

package() {
        _pkg=melondsds_libretro-linux-x86_64-Release
        if [ "${CARCH}" = "aarch64" ]; then
          _pkg=melondsds_libretro-linux-arm64-Release
        fi

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
