# Maintainer: David Birks <david@birks.dev>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=kubeseal-bin
pkgver=0.13.1
pkgrel=1
pkgdesc='A tool for one-way encrypted secrets in Kubernetes'
arch=('x86_64')
url='https://github.com/bitnami-labs/sealed-secrets'
license=('Apache')
provides=('kubeseal')
conflicts=('kubeseal')
source=("$pkgname-$pkgver::https://github.com/bitnami-labs/sealed-secrets/releases/download/v$pkgver/kubeseal-linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/bitnami-labs/sealed-secrets/master/LICENSE')
sha256sums=('e6f2f5a8c22124a055c1b6bdbee7936c5b92bc44105a92441d86595b22d71604'
            'b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')

package() {
  install -Dm 755 "$srcdir"/$pkgname-$pkgver "$pkgdir"/usr/bin/kubeseal
  install -Dm 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/kubeseal/LICENSE
}

