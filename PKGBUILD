# Maintainer: Duologic <jeroen@simplsitic.be>
# Maintainer: sh0rez <me@shorez.de>

pkgname=tanka-bin
pkgver=0.11.1
pkgrel=0
pkgdesc='Flexible, reusable and concise configuration for Kubernetes using Jsonnet'
arch=('x86_64')

url='https://tanka.dev'
license=('Apache')
source=("tk-$pkgver::https://github.com/grafana/tanka/releases/download/v${pkgver}/tk-linux-amd64")

depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)

provides=(tanka)
conflicts=(tanka)

sha256sums=('59e2dba1e533f4b6bf7f1bf7e35e25e7b8754931720147b70bb375dd173e01c2')

package() {
  install -Dm 755 "$srcdir/tk-$pkgver" "$pkgdir/usr/bin/tk"
}
