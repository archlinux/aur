# Maintainer: Robert Zhou <meep dot aur at meepzh dot com>
# Contributor: Julie Shapiro <jshapiro at nvidia dot com>

pkgname=p4
_version=2026.1
pkgver=2026.1.2951233
pkgrel=1

pkgdesc="Perforce's Helix command-line client"
arch=('x86_64')
depends=('glibc')
url="https://www.perforce.com"
license=('custom:p4')

_url="https://cdist2.perforce.com/perforce"
_filename="${pkgname}-${pkgver}.tgz"

source=(LICENSE
        "${_filename}"::"${_url}/r${pkgver:2:4}/bin.linux26x86_64/helix-core-server.tgz")


sha256sums=('c4ed3aef62b1bbf2d16ce4cceb65dc49ab9635b38e2fed0a595fe259283a9f32'
            'c022340f8b22b46c9379a5fd5192f3ec751b24fb48195a58212052a186b5c874')

# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')

package() {
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}

# vim:set ts=2 sw=2 et:
