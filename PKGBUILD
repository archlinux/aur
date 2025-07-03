# Maintainer: Jat <chat@jat.email>
# Maintainer: Yonaton <yonaton.chriqui@gmail.com>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.1.7.8
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
sha512sums=('e41364b254b5b9a9cf5a6ae8b8bfd2b66ef2fe1160eccf270198f0854f71b7b2a200f1a61cabe52f26245935d3ad986cf13f9bbf2e9067ab338078f1caa4d8c2')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
