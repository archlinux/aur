# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.22.2
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=('i686' 'x86_64')
license=('Apache2')
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk8-openjdk)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz ${_base})
sha512sums=('60248d611cdc4b7d387ce8c0a326651619544cc934de3077c3b2abfe86f57c80d6b15d02be0fdfd7294a40f14d30218650cc0b3955f59fc61428bf2f713a0a7a'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
