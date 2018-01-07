# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Daniel Micay <danielmicay@gmail.com>
# Contributor: Federico Cinelli <cinelli@aur.archlinux.org>

pkgname=envoy
pkgver=14
pkgrel=2
pkgdesc='A ssh-agent/gpg-agent keychain and process monitor'
arch=('x86_64')
url='https://github.com/vodik/envoy'
license=('GPL')
depends=('openssh' 'systemd')
optdepends=('gnupg: gpg-agent support')
makedepends=('ragel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/vodik/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('4130f2080ac1a083607e6764a59fd02c')

build() {
  make -C "$pkgname-$pkgver"
}

package() {
  make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}
