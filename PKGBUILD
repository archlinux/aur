# Maintainer: CJ Gilroy <cgilroy33@gmail.com>
pkgname='discordutility'
pkgver=r2.552c041
pkgrel=1
pkgdesc="A simple utility for the .tar.gz version of Discord"
arch=('x86_64')
url="https://github.com/CJendantix/discordutility"
license=('MIT')
depends=('curl' 'gzip')
makedepends=('git')
provides=('package')
source=('discordutility::git+https://github.com/CJendantix/discordutility.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$pkgname"
	sudo install -Dm755 ./discordutility $pkgdir/usr/bin/discordutility
}
