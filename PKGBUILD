# Maintainer: Robert Zhou <meep (dot) aur (at) meepzh (dot) com>
# Contributor: Joakim Hellsen (tlovinator@gmail.com)
# Contributor: Andrew Boktor andrew dot boktor at gmail dot com

pkgname=p4d
_version=2025.2
pkgver=2025.2.2882317
pkgrel=1
pkgdesc="Minimal Perforce Helix Core Server"
arch=('x86_64')
url="https://www.perforce.com"
license=('custom:p4d')
depends=()
backup=('etc/p4d.conf')
install="${pkgname}.install"
_filename="${pkgname}-${pkgver}.tgz"
source=("${_filename}"::"https://cdist2.perforce.com/perforce/r${pkgver:2:4}/bin.linux26x86_64/helix-core-server.tgz"
        p4d.service
        p4d.conf
       )
# Perforce Software (Package Signing) <support+packaging@perforce.com>
validpgpkeys=('7123CB760FF18869'
              'E58131C0AEA7B082C6DC4C937123CB760FF18869')
b2sums=('406de9d1b1b0036b51bd405f14480e8dd208564eafce8823d591ec07beac23cd39d53d2cf66c3c634056da9f1c2afe4a5d9aa99ffbda280a93f4f3c49c319231'
        'dc0666cc96442b03f403991c20f2307114c750a99de48b116bf25e5c4cf8b89efd7ac693104d45600a453d4940debefe8b958254c8b00c5fc080a2cd2f07cc29'
        '4682a3f35e6053c1ffd53e5e49cd07d8d895db69fe66856d94a91670133070f216d754a70b56aa68e27c43dccff4ebac28ed8aa6cdb66eb3311eb59a89718703')

package() {
    install -Dm755 ${pkgname} ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 p4d.service ${pkgdir}/usr/lib/systemd/system/p4d.service
    install -Dm644 p4d.conf ${pkgdir}/etc/p4d.conf
}
