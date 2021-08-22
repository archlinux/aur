# Maintainer: Kookies <kookies@tutamail.com>

pkgname=nfs2iso2nfs-git
_gitname="nfs2iso2nfs"
pkgver=v0.5.6.0.gb47a6bb
pkgrel=1
pkgdesc="convert nfs files to iso and back (git version)"
arch=('x86_64')
url="https://github.com/FIX94/nfs2iso2nfs"
license=('unknown')
depends=('mono')
makedepends=('git')
provides=("$_gitname")
conflicts=("$_gitname")
source=('git+https://github.com/FIX94/nfs2iso2nfs.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  git describe --long --tags | sed 's/([^-]*-g)/r1/;s/-/./g'
}

build() {
  cd $_gitname
  mcs Program.cs -out:$_gitname
}

package() {
  cd $_gitname
  install -Dm755 $_gitname "${pkgdir}/usr/bin/$_gitname"
}
