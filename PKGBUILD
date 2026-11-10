# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.46.2
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=(i686 x86_64)
license=(Apache-2.0)
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk17-openjdk bash)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz
  ${_base})
sha512sums=('f0bddaf60b2adfaab6abd0ac8aca7d2d3e60d61a7d6f20ef32eea3f5304c079f977a8f46ee5bc3ce168bc6d5184fcda6c19892eae7df083230d57e8f0c4802a2'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
