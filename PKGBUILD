# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>
# Contributor: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4
_version=2026.1
pkgver=2026.1.3062361
pkgrel=1

pkgdesc="Perforce's Helix command-line client"
arch=('x86_64')
depends=('glibc')
url="https://www.perforce.com"
license=('custom:p4')
options=('!debug')

_url="https://filehost.perforce.com/perforce"
_filename="${pkgname}-${pkgver}-${pkgrel}.tgz"

source=(LICENSE
        "${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/helix-core-server.tgz")


b2sums=('17cc2778ca5c75b84b1dd210e5fdc06366e3019da86c9eb2039f285f807a4bf9dfeaa2d3d8040810e5eb0c8738caad1fa4af15985040b3e132f1d7f9a0fc0da6'
        '9afc3cb33ed59fde55d7dc49a3756b1fb143281333ad42a8ee4ac62172e9a765ee6b4e7fee69cbadc330dd6e51ebcd6a786ee9f7aeeb91d26f0a55e2837c92df')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
