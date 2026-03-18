# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=spice-crypt
pkgver=1.2.0
pkgrel=1
pkgdesc='Tool to decrypt encrypted LTSpice models'
arch=(any)
url='https://github.com/jtsylve/spice-crypt'
license=(AGPL-3.0-or-later CC-BY-4.0)
depends=(python)
makedepends=(
  git
  python-build
  python-installer
  python-hatchling
)
source=("$pkgname::git+$url#tag=v$pkgver")
sha512sums=('79be65b082def324d3dc99e0fed57f9ed9d96153089572a7213b4f9f7a2331d0dbef4382d06232df503ce45f2fc7827f10186cca95585d1dbbf9a1158e2b66a6')
b2sums=('6d927a9908822d54393f8629b30a8190fa6856271aca646763aa7997d904c62d010c851903f73b74eab4f858be38d79ba28e89c5c7d805d66b0a114d00bafcf3')

build() {
  cd "$pkgname"

  python -m build --wheel --no-isolation
}

package() {
  cd "$pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
