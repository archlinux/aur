# Maintainer: Tom Wadley <tom@tomwadley.net>

pkgname=chamber
_upstreamver=2.9.1-ci2
pkgver="${_upstreamver//-/_}"
pkgrel=1
pkgdesc="A tool for managing secrets using AWS SSM Parameter Store"
arch=('x86_64')
url="https://github.com/segmentio/$pkgname/"
license=('MIT')
source=("https://github.com/segmentio/$pkgname/releases/download/v$_upstreamver/$pkgname-v$_upstreamver-linux-amd64"
        "$pkgname-$_upstreamver-LICENSE::https://raw.githubusercontent.com/segmentio/$pkgname/v$_upstreamver/LICENSE")
sha256sums=('0741bbc0600b09a577e814d41f87e1eaf27195f7413cbc0e2aa0bc678ef25e6e'
            'feaff489d3c077f7b48cf76a5f038604338a092be379c1297c64c26c6b81714b')

package() {
  install -Dm755 "$pkgname-v$_upstreamver-linux-amd64" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname-$_upstreamver-LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
