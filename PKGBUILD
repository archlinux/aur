# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.17.1
pkgrel=0
pkgdesc='Flexible, reusable and concise configuration for Kubernetes using Jsonnet'
arch=('x86_64')

url='https://tanka.dev'
license=('Apache')
source=("tk-$pkgver::https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")

depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
  'helm: optional helm integration'
  'kustomize: optional kustomize integration'
)

provides=(tanka)
conflicts=(tanka)

package() {
  install -Dm 755 "$srcdir/tk-$pkgver" "$pkgdir/usr/bin/tk"
}

sha256sums=('c87f9eb9bd2e0d9280032efe8844badbc8b4c608affc9102d3054a40cc9755e3')
