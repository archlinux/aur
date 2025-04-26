# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.34.0
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=(i686 x86_64)
license=(Apache-2.0)
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk17-openjdk bash)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz
  ${_base})
sha512sums=('83ad1b3acda7971ea9eda4640b139f4fbbd0aab3ff2257ed8d1ff3fd0d5836117ea6897a927dba4cf787df2fd1028231b490ac14901cb4468a4b7632eec11e7b'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
