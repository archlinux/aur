# shellcheck shell=bash
# -*- sh -*-

# Maintainer: Klaus Alexander Seiﬆrup <$(echo 0x1fd+d59decfa=40 | tr 0-9+a-f=x ka-i@p-u.l)>

pkgname=kronisk
pkgdesc='Runs a command quietly unless it fails. Python implementation of chronic(1).'
pkgver=0.1.0
pkgrel=6
url='https://codeberg.org/kas/kronisk'
arch=('any')
license=('GPL-3.0-or-later')
#makedepends=('scdoc')
depends=('python')
options=('!strip')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(
  '06cdb3da1de3cae30a2c0c5e27db072e6eb1b72f65207bb0d4d2dbd029dcfdb2'
)

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make PREFIX=/usr DESTDIR="$pkgdir" install
}

# eof
