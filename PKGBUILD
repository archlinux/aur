# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.43.0
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
            'da2b312c243c4479a05da515352b6ac0d36b3bac6505a501670eb3785c4ad417'
            '10ab69d1da61d260155c7e44a427532c22ee3e43882f6bb6ad828abfe5b4def9')
sha256sums_x86_64=('a16d4b8b917e36b96b09b30ecb7a5049d06ff1e88b856a101eec12b86b33fe05')
sha256sums_aarch64=('f66e3c9ab7664b7633d57d2d5303e0db75deb4045e1b32c3493c0d8ba68a70f7')
source_x86_64=("${_internalname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_internalname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_arm64.tar.gz")

package() {
    install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 "${_internalname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${_internalname}-${pkgver}-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${_internalname}-${pkgver}-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
