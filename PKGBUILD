# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Pavel Merzlyakov <pavel.merzlyakov@gmail.com>
_base=allure
pkgname=${_base}-commandline
pkgver=2.23.0
pkgrel=1
pkgdesc="A flexible, lightweight multi-language test reporting tool"
arch=('i686' 'x86_64')
license=('Apache2')
url="https://github.com/${_base}-framework/${_base}2"
depends=(jdk8-openjdk)
source=(${url}/releases/download/${pkgver}/${_base}-${pkgver}.tgz ${_base})
sha512sums=('c2fd884606f2123fa16cfe7786f87ca60ff444633a7af23f3c8be8af01fbcb2fb086fb1bd2065f9d325d0a44dbf8e25284e5a38508d37d6a74ff6a6001f456e7'
            'd1c50028f8ba9d791d113314cec71c5174a69e1e9136c1d22bfb58e844d20f7c15c1917184e827bbdfbd25ffd7a0fc5259004e57da331f54948f25e310927ad5')

package() {
  install -Dm755 ${_base} "${pkgdir}/usr/bin/${_base}"
  installdir="${pkgdir}/opt/${pkgname}"
  mkdir -p "${installdir}"
  for dir in bin config lib plugins; do
    cp -r "./${_base}-${pkgver}/${dir}" "${installdir}/"
  done
}
