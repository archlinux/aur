# Maintainer: Jat <chat@jat.email>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.0.2.6
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
sha512sums=('b2bb9d400f8978c1151cf9c4f76da9bf9248a32a8a343f3f7f2c86821b52b471657f4c7fdb06575b649acf3caee2b1e5c33949acf9c3fec9f4631d130ca119b5')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
