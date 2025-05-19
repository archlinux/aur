# Maintainer: Jat <chat@jat.email>
# Maintainer: Yonaton <yonaton.chriqui@gmail.com>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.1.5.2
pkgrel=1
pkgdesc='C# application that allows you to farm steam cards using multiple steam accounts simultaneously.'
arch=('x86_64')
url='https://github.com/JustArchiNET/ArchiSteamFarm'
license=('Apache')
depends=('dotnet-runtime')
makedepends=('unzip' 'curl' 'jq')
noextract=("${_pkgname}-${pkgver}.zip")
options=('!strip' 'staticlibs')

source=(
  "${_pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/ASF-linux-x64.zip"
)
sha512sums=('acf3352e4b921b7c4670047fb1154008ca44cf5cfb159be14dd9f623303eaea947b3f31331c7df2c33cf4d0b08b7ec007c03fd77011aae0987a7525acc9644cd')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
