pkgdesc="Command line utility to build and modify App Container Images (ACI)"
pkgname=acbuild
pkgver=0.3.1
pkgrel=1
arch=('i686' 'x86_64')
url="https://github.com/appc/acbuild"
source=(
    "git+$url.git#tag=v$pkgver"
)
md5sums=('SKIP')
makedepends=('git' 'go')
optdepends=(
    'gnupg: required to sign container images'
)
license=('Apache')

build() {
  cd "$pkgname"
  ./build
}

package() {
  cd "$pkgname"
  install -D -m755 bin/$pkgname "$pkgdir/usr/bin/$pkgname"
}
