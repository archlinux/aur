# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.48.0
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
            'fb87c1ee15d1e2caa2f6b9239034507b817c541a7df6333bf4b6d7fc739f6ceb')
sha256sums_x86_64=('8809d2f4fe95a0299b1a2a5c6bc912c4aba4b90a7b5e2c1f5cf11b9945a50004')
sha256sums_aarch64=('fc40524368d2cb6213bdfe0b736b5884e1b55c6368706d7a285542cb7e559b68')
source_x86_64=("${_internalname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_internalname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_arm64.tar.gz")

package() {
    install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 "${_internalname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${_internalname}-${pkgver}-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${_internalname}-${pkgver}-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
