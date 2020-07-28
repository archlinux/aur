# Maintainer: David Birks <david@birks.dev>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=kubeseal-bin
pkgver=0.12.5
pkgrel=1
pkgdesc='A tool for one-way encrypted secrets in Kubernetes'
arch=('x86_64')
url='https://github.com/bitnami-labs/sealed-secrets'
license=('Apache')
provides=('kubeseal')
conflicts=('kubeseal')
source=("$pkgname-$pkgver::https://github.com/bitnami-labs/sealed-secrets/releases/download/v$pkgver/kubeseal-linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/bitnami-labs/sealed-secrets/master/LICENSE')
sha256sums=('9e6f5e6a98b86e4801fb14677815655013776140d739c66b74b5968a4bb8be0e'
            'b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')

package() {
  install -Dm 755 "$srcdir"/$pkgname-$pkgver "$pkgdir"/usr/bin/kubeseal
  install -Dm 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/kubeseal/LICENSE
}

