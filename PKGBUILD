# Maintainer: Jat <chat@jat.email>
# Maintainer: Yonaton <yonaton.chriqui@gmail.com>

_pkgname=archisteamfarm
pkgname="${_pkgname}-bin"
pkgver=6.1.2.3
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
sha512sums=('5e49928142759131b9ca1a223c4e612cc69987c22143773f6ba89fca83d4734de3d0cd1bdd4e216342953cf798e3a66c2a333e5fdf884de70fce9e853773ab9c')

prepare() {
  unzip "${_pkgname}-${pkgver}.zip" -d "${_pkgname}-${pkgver}"
}

package() {
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/share/applications"

  cd "${srcdir}/${_pkgname}-${pkgver}"
  chmod a+w config logs
  cp -a . "${pkgdir}/opt/${_pkgname}"
}
