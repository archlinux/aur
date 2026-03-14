# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.38.0
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=(i686 x86_64)
license=(Apache-2.0)
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk17-openjdk bash)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz
  ${_base})
sha512sums=('4d0e03a716801c895e52dd6245054420881781d9aabdade6fb520c24d6bc2985ae9db982be33f0713ceb008589ef6964e8b577eabf7a9e1466932658c5079472'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
