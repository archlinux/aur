# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.39.0
pkgrel=2
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
            'ba3180f58671b117fc154f99057f2b87242424b2c6b5fadda908ba6cc0bc6944'
            '8c4732adfc743949bb966d6ac3de73f26e23822115a03ba290e832a59bf88b12')
source_x86_64=("${_internalname}-${pkgver}-x86_64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_internalname}-${pkgver}-aarch64.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('76100bce13c976b0acf3c7172a0e52d4c06da95ade42f620ad57707cd532f3e8')
sha256sums_aarch64=('040984e38291da2f23ddeefbd67371c5bf32de6be3177d4f5a816f7fe51bacb7')

package() {
    install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 "${_internalname}-${pkgver}-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "${_internalname}-${pkgver}-README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "${_internalname}-${pkgver}-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
}
