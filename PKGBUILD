# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.17.3
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=('i686' 'x86_64')
license=('Apache2')
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk8-openjdk)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz ${_base})
sha512sums=('59c5226c11a1c72f41c2cdba8b34e2b1faeb41942a031c4361177c741a2dad1c1d59593f3dc71faa4f270cf2b896d51790591b54c3a51ce9d0ad574f7f726b96' 'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
