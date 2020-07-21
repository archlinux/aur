# Maintainer: Lukas Grossar <lukas.grossar@gmail.com>
# Maintainer: sh0rez <me@shorez.de>
# Maintainer: Duologic <jeroen@simplsitic.be>

pkgname=tanka
pkgver=0.11.1
pkgrel=0
pkgdesc="Flexible, reusable and concise configuration for Kubernetes using Jsonnet"
arch=('i686' 'x86_64' 'arm' 'aarch64')

url="https://tanka.dev"
license=('Apache')
source=("git+https://github.com/grafana/tanka#tag=v${pkgver}")

makedepends=('git' 'go')
depends=('diffutils' 'kubectl')
optdepends=(
  'jsonnet-bundler-bin: jsonnet package manager'
)

provides=(tanka)
conflicts=(tanka-bin)

md5sums=('SKIP')

build() {
  cd "$srcdir/tanka"
  make static
}

package() {
  install -Dm755 "$srcdir/tanka/tk" -t "$pkgdir/usr/bin"
}
