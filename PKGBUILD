# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.48.1
pkgrel=1
pkgdesc="Google Suite CLI: Gmail, GCal, GDrive, GContacts."
arch=('x86_64' 'aarch64')
url="https://github.com/openclaw/gogcli"
license=('MIT')
provides=('gog')
conflicts=('gog')
options=('!strip' '!debug')

source=("${_internalname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/openclaw/gogcli/v$pkgver/LICENSE"
  "${_internalname}-${pkgver}-README.md::https://raw.githubusercontent.com/openclaw/gogcli/v$pkgver/README.md"
  "${_internalname}-${pkgver}-CHANGELOG.md::https://raw.githubusercontent.com/openclaw/gogcli/v$pkgver/CHANGELOG.md")
sha256sums=('14293556b79940745123d0160c71d27ed0e9fe9b8a848093f3ed78f4853caafe'
            'ba3ca079c32fee912761678361a05383586ef97358aec3d60e34acfcb11bc3ab'
            '3084b0645dcdadb9a21459f8199f6797b99077fd867d0b2bf3c20db1ba2ee0bd')
sha256sums_x86_64=('dcd956e09d1222a07c1304d836f8acd55266b2fa241ef466580ced6a02453d72')
sha256sums_aarch64=('c091fa2014dc3d5608acef4d09fb3bb4a3eb71e4cff898b5eaddd9703599e45c')
source_x86_64=("${_internalname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_internalname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_arm64.tar.gz")

package() {
  install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

  install -Dm644 "${_internalname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "${_internalname}-${pkgver}-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "${_internalname}-${pkgver}-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
