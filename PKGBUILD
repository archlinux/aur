# Maintainer: Jat <chat@jat.email>
# Maintainer: Yonaton <yonaton.chriqui@gmail.com>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.1.1.3
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
sha512sums=('932194a051963efd790369a7b80daf64a6d3979af842614d93dc1a7ae5332aa91fa33201a52fb333e940b84f9c4d595a017f7e46be0dda4f9dd18d7aafb217f7')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
