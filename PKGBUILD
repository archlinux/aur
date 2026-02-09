# Maintainer: gomanager <gomanager@generated>
pkgname=mufetch
pkgver=0.1.1
pkgrel=2
pkgdesc="neofetch-style music cli"
arch=('x86_64' 'aarch64')
url="https://github.com/ashish0kumar/mufetch"
license=('MIT')
depends=('glibc')
makedepends=('go' 'git')
source=("git+https://github.com/ashish0kumar/mufetch.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$pkgname" || exit
  go build \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags='-s -w' \
    -o $pkgname \
    .
}

package() {
  cd "$pkgname" || exit
  install -Dm 755 $pkgname -t "$pkgdir/usr/bin"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
}
