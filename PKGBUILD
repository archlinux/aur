# Contributor: .NET Core Community <https://www.dotnetcore.xyz/>
# Maintainer: Pika Kolendo <pikakolendo02[a]gmail.c0m>
pkgname='fastgithub-bin'
_pkgName='fastgithub'
pkgver=2.1.3
pkgrel=1
pkgdesc="Speedup github access in China"
arch=('x86_64')
url="https://github.com/dotnetcore/FastGithub"
_urlprefix="https://github.abskoop.workers.dev/"
license=('MIT')
depends=('mono')
options=('!strip')
provides=('fastgithub')
install="${pkgname}.install"
source=("${_urlprefix}${url}/releases/download/${pkgver}/${_pkgName}_linux-x64.zip")
sha256sums=('94a881d9099fb5c40fcf0132f7fcb03552699dd23f8c2338e1f84dfd4c45c5d3')

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    mkdir -p "${pkgdir}/usr/bin"
    cp -a "${srcdir}/${_pkgName}_linux-x64/"* "${pkgdir}/opt/${pkgname}"
    ln -s "/opt/${pkgname}/${_pkgName}" "${pkgdir}/usr/bin/${_pkgName}"
}
