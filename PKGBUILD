# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>
# Contributor: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4
_version=2026.1
pkgver=2026.1.2972966
pkgrel=2

pkgdesc="Perforce's Helix command-line client"
arch=('x86_64')
depends=('glibc')
url="https://www.perforce.com"
license=('custom:p4')
options=('!debug')

_url="https://filehost.perforce.com/perforce"
_filename="${pkgname}-${pkgver}.tgz"

source=(LICENSE
        "${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/helix-core-server.tgz")


b2sums=('17cc2778ca5c75b84b1dd210e5fdc06366e3019da86c9eb2039f285f807a4bf9dfeaa2d3d8040810e5eb0c8738caad1fa4af15985040b3e132f1d7f9a0fc0da6'
        '805245e2d7861dcb31d34580c33ad6b1367d864abdf08d48003873e7b760723149d31b571c9c7d44b65330ea0b7035dde1fb55645cf459599f632801ddb740be')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
