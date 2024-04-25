# Maintainer: Jat <chat@jat.email>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.0.1.24
pkgrel=2
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
sha512sums=(
  '76832ee156a6fb895d64dd1ae7b1dace6413e1acf208c54ed3a7a0dde301a6a91b36aef89508220f27fe7a03bee07525ef08eaed00c44ccfda4608bd020632e4'
)

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
