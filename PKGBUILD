# Contributor: .NET Core Community <https://www.dotnetcore.xyz/>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='fastgithub-bin'
_pkgName='fastgithub'
pkgver=2.1.4
pkgrel=3
pkgdesc="Speedup github access in China"
arch=('x86_64')
url="https://github.com/dotnetcore/FastGithub"
_url="https://ghproxy.com/${url}"
license=('MIT')
depends=('mono')
options=('!strip')
provides=('fastgithub')
install="${pkgname}.install"
source=("${_url}/releases/download/${pkgver}/${_pkgName}_linux-x64.zip")
sha256sums=('01106995885a907c5832c594880f79763e6074877e20d61c391b3e9912a3b038')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cp -a "${srcdir}/${_pkgName}_linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${_pkgName}" "${pkgdir}/usr/bin/${_pkgName}"
}
