# Maintainer: Kevin MacMartin <prurigro@gmail.com>

_pkgname=xiny
pkgname=$_pkgname-git
pkgver=0.3.4
pkgrel=1
pkgdesc='A simple command line tool for converting between various units of measurement'
url='https://github.com/bcicen/XinY'
license=('MIT')
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
makedepends=('go' 'git')
source=("git+https://github.com/bcicen/xiny")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's|^[^-]*-v||;s|-|.r|;s|-|.|g'
}

build() {
  cd $_pkgname
  make build
}

package() {
  cd $_pkgname
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
