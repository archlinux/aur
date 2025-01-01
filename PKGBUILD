# Maintainer: marzeq <marzeqmarzeq at gmail dot com>

pkgname=mconf
pkgver=24.1_1
local gittag="${pkgver//_/-}"
pkgrel=1
pkgdesc="Parser for the mconf configuration language"
arch=("x86_64" "aarch64")
url="https://github.com/marzeq/mconf"
license=("WTFPL")
depends=("go" "git")
source=("git+https://github.com/marzeq/mconf.git#tag=v$gittag")
md5sums=("SKIP")
provides=("mconf")
conflicts=("mconf-bin")

build() {
  cd "$srcdir/$pkgname"
  go build -o mconf
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 mconf "$pkgdir/usr/bin/mconf"
}

