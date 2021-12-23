# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.19.0
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

sha256sums=('e6ee154b1d13f04fc6c2d8f22c8e694d4295d91079021e9f06ff60ed0c1f1726')
