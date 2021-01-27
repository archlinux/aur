# Maintainer: Sebastiaan Tammer <sebastiaantammer at gmail dot com>
# Contributor: David Birks <david at birks dot dev>
# Contributor: Stefan Cocora <stefan dot cocora at gmail dot com>

pkgname=kubeseal-bin
pkgver=0.14.1
pkgrel=1
pkgdesc='A tool for one-way encrypted secrets in Kubernetes'
arch=('x86_64')
url='https://github.com/bitnami-labs/sealed-secrets'
license=('Apache')
provides=('kubeseal')
conflicts=('kubeseal')
source=("$pkgname-$pkgver::https://github.com/bitnami-labs/sealed-secrets/releases/download/v$pkgver/kubeseal-linux-amd64"
        'LICENSE::https://raw.githubusercontent.com/bitnami-labs/sealed-secrets/master/LICENSE')
sha256sums=('6887664409a5c2339ab7143356bdb6c220a4cf928568d01745e1e668d8f3fed6'
            'b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1')

package() {
  install -Dm 755 "$srcdir"/$pkgname-$pkgver "$pkgdir"/usr/bin/kubeseal
  install -Dm 644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/kubeseal/LICENSE
}

