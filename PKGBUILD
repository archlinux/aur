# Maintainer: Andrey Novikov <envek@envek.name>

pkgname=lefthook
pkgdesc="git hooks manager"
pkgver=0.6.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/Arkweid/lefthook"
license=('MIT')
makedepends=('go' 'rsync')
source=("https://github.com/Arkweid/lefthook/archive/v${pkgver}.tar.gz")
sha256sums=('4ef37af5baf2e349037241b3365a8730058cbada5e9ea730f4cb0dfb09749318')

build() {
  cd "$pkgname-$pkgver"
  go build \
    -gcflags "all=-trimpath=${PWD}" \
    -asmflags "all=-trimpath=${PWD}" \
    -ldflags "-extldflags ${LDFLAGS}" \
    .
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}