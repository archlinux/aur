# Maintainer: zhullyb <zhullyb@outlook.com>

pkgname=bash2048-git
pkgver=1.0.r14.g37da521
pkgrel=1
pkgdesc="Bash implementation of 2048 game"
url="https://github.com/mydzor/bash2048"
arch=('any')
license=("Unlicense")
depends=()
provides=('bash2048')
source=("git+https://github.com/mydzor/bash2048.git")

md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/bash2048"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd $srcdir/bash2048
  install -D -m 755 bash2048.sh "$pkgdir/usr/bin/bash2048"
  install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
} 
 
