# Maintainer: Klaus Alexander Seiﬆrup <klaus@seistrup.dk>
# -*- mode: sh -*-

pkgname=kronisk
pkgver=0.1.0
pkgrel=2
pkgdesc='Runs a command quietly unless it fails. Python implementation of chronic(1).'
arch=('any')
url="https://github.com/kseistrup/kronisk"
license=('GPL3')
provides=('kronisk')
conflicts=('kronisk')
depends=('python')
makedepends=('scdoc')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
)
md5sums=(
  '65c50901d527befa8bf63340279ba3a3'
)
sha1sums=(
  '93ce7c50b4ba7b12be8640566ac6430b89a55b52'
)
sha256sums=(
  'ca49dcec8e3c8ca70365bb5e59fb443eafffe3578d160776a35299892f23d2b0'
)
sha512sums=(
  '251e01cd5d9618ca2f91096c3e60a74f50ee710e39003154104900cd4d2880296572f9d9a0c2afec7c656df37bf9860a635811e6f728084272316ba3cb9c6b69'
)
b2sums=(
  'e28c3d71c69dda326c692ab29f00cb4de909cac11e74d59e89c08e5f4c8ca28688c6bbdc01a92a78efe6334802070bd7a7bf183c05c0452c4163bd1dc36e9bc8'
)

build() {
  cd "$pkgname-$pkgver" || exit 1

  make
}

package() {
  cd "$pkgname-$pkgver" || exit 1

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# eof
