# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=archlog-git
pkgver=0.5.r0.g3178189
pkgrel=1
pkgdesc='View changes to a svn repo, formatted as a ChangeLog'
arch=('x86_64' 'i686')
url='http://github.com/xyproto/archlog'
license=('GPL2')
makedepends=('go')
depends=('subversion')
source=('archlog::git://github.com/xyproto/archlog.git#tag=0.5')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-git}"

  go build
}

package() {
  cd "${pkgname%-git}"

  install -Dm755 archlog "$pkgdir/usr/bin/archlog"
}

# vim:set ts=2 sw=2 et:
