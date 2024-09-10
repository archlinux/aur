# Maintainer: Yangtse Su <yangtsesu@gmail.com>
_pkgname=libretro-melondsds
pkgname=$_pkgname-bin
pkgver=1.1.7
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
b2sums_x86_64=('fbb66f12968283d0bbcbe9ee748a4f2a76e131ee92a7107516a72052bda6d49a48d86cb1141b5ac2bcfaa84828c96cf13830f7a5f1a8eef1fa6b448d95766ae6')
b2sums_aarch64=('99eb4e33793cfa396738523d90b3557e2dc7b719971c5dfceb1f0549eb680b1a6188a219eebd04a63452a61337aadfe649aad873b25b9e836eadce385a975527')

package() {
        _pkg=melondsds_libretro-linux-x86_64-Release
        if [ "${CARCH}" = "aarch64" ]; then
          _pkg=melondsds_libretro-linux-arm64-Release
        fi

	install -Dm644 -t "$pkgdir"/usr/lib/libretro "${srcdir}/${_pkg}/cores/melondsds_libretro.so"
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname "${srcdir}/${_pkg}/cores/melondsds-LICENSE.txt"
}
