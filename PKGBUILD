# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.47.0
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
            '4190bfed0c49df8a83fe3222ad2c8a2cda21e4d3d84ec3c03f2a329771e88335')
sha256sums_x86_64=('c3ed94efca90c754cdda300e3c7f8cc2f3d7df86d3fdc5d11f996c7518a09c24')
sha256sums_aarch64=('90d236ab91c6dae7139bfe0508eab94a8b4323238b62fa29e6cf479a352576f2')
source_x86_64=("${_internalname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_internalname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_arm64.tar.gz")

package() {
    install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 "${_internalname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${_internalname}-${pkgver}-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${_internalname}-${pkgver}-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
