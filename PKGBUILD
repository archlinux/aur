# Maintainer: tmtaxman <tmtaxman2 at gmail dot com>

pkgname=gogcli-bin
_internalname=gogcli
_pkgbin=gog
pkgver=0.35.0
pkgrel=1
pkgdesc="Google Suite CLI: Gmail, GCal, GDrive, GContacts."
arch=('x86_64')
url="https://github.com/openclaw/gogcli"
license=('MIT')
provides=('gog')
conflicts=('gog')
options=('!strip' '!debug')

source=("${_internalname}-${pkgver}.tar.gz::$url/releases/download/v$pkgver/${_internalname}_${pkgver}_linux_amd64.tar.gz")
sha256sums=('c4e7e349c53d3e69e36729d4315a0e080a85a4b4767a84943f075067931bcbdf')

package() {
    install -Dm755 "${_pkgbin}" -t "$pkgdir/usr/bin/"

    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 README.md CHANGELOG.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
