pkgdesc="App Container Image Build Command"
pkgname=acbuild
pkgver=0.3.1
pkgrel=2
arch=('i686' 'x86_64')
url="https://github.com/appc/acbuild"
source=(
    "git+$url.git#tag=v$pkgver"
)
md5sums=('SKIP')
makedepends=('git' 'go')
options=('!strip')
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
