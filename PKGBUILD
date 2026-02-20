# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.37.0
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=(i686 x86_64)
license=(Apache-2.0)
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk17-openjdk bash)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz
  ${_base})
sha512sums=('d840323d6bbe6617698344296c9765ab5ab3a69528968edf59ddf7db63e3479cdc928f9543db48dee02f0ef730a8a72b9f749ed013b1165834485762ec232817'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
