# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.18.1
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=('i686' 'x86_64')
license=('Apache2')
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk8-openjdk)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz ${_base})
sha512sums=('22298b2f09b5087bae56a83983425b31402e2edd65dac152353a712abb613611a9981f9790d9fa8deafe9ade715505092a6c33cf2420815b7070c00cd448259e' 'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
