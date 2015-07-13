# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: maz-1 <loveayawaka at  gmail dot com>

pkgname=onedrive-fuse-fs-git
pkgver=r17.bbd6a93
pkgrel=2
pkgdesc="Script to mount Microsoft OneDrive folder as a FUSE filesystem"
arch=('any')
url="https://github.com/mk-fg/onedrive-fuse-fs"
license=('WTFPL')
depends=('python2' 'python2-onedrive-git' 'python2-fusepy-git')
makedepends=('git')
provides=('onedrive-fuse-fs')
conflicts=('onedrive-fuse-fs')
options=(!emptydirs)
source=("$pkgname"::'git+https://github.com/mk-fg/onedrive-fuse-fs.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ./onedrivefs ${pkgdir}/usr/bin/onedrivefs
  install -Dm644 ./COPYING ${pkgdir}/usr/share/doc/${pkgname}/COPYING
  install -Dm644 ./README.md ${pkgdir}/usr/share/doc/${pkgname}/README.md
}
