# Maintainer: White-Oak <lpzhelud@gmail.com>
pkgname=docker-clean-git
pkgver=v2.0.4.r3.g8c8cb40
pkgrel=1
pkgdesc="A script that cleans docker containers, images, volumes, and networks."
arch=('x86_64')
url="https://github.com/ZZROTDesign/docker-clean"
license=('MIT')
makedepends=('git')
depends=('docker')
md5sums=('SKIP')
source=('docker-clean-git::git+https://github.com/ZZROTDesign/docker-clean.git')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	install -Dm755 "$srcdir/$pkgname/docker-clean" "$pkgdir/usr/local/bin/docker-clean"
}
