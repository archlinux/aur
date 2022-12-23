# Contributor: Dušan Simić <dusan.simic1810@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nitch-git
pkgver=0.1.6.r22.g42ad689
pkgrel=1
pkgdesc="Incredibly fast system fetch written in nim - newest git checkout"
arch=(x86_64)
url=https://github.com/unxsh/nitch
license=(MIT)
makedepends=('nim' 'git' 'openssl-1.1')
source=("git+$url")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  git describe --tags | sed 's+-+.r+'|tr - .
}

build() {
  cd "${pkgname%-git}"
  nimble build
}

package() {
  cd "${pkgname%-git}"
  install -Dm755 -t "$pkgdir"/usr/bin "${pkgname%-git}"
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname LICENSE
}
