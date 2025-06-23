# Maintainer: Jat <chat@jat.email>
# Maintainer: Yonaton <yonaton.chriqui@gmail.com>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.1.6.7
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
sha512sums=('79b3b1b82cb9208c4495c19f017bf95ef16f5c1e0d921f4c51125bb895a4b5b775aec0b92ecd8043e87f07eb1a28006c48363eeb7f5a4a4e3004d727b46e5d61')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
