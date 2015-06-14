# Maintainer: Anton S <fluffylime at gmail dot com>

pkgname=shifty-git
_realname=awesome-shifty
pkgver=20140817
pkgrel=6
pkgdesc="Dynamic tagging library for Awesome window manager"
arch=("any")
url="http://awesome.naquadah.org/wiki/Shifty"
license=("GPL2")
depends=("awesome")
makedepends=("git")
conflicts=("shifty")
provides=("shifty")

source=(git://github.com/cdump/awesome-shifty.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_realname}"
  git log -1 --format="%cd" --date=short | tr -d '-'
}

package() {
  cd "$srcdir/${_realname}"
  install -Dm644 "init.lua" "${pkgdir}/usr/share/awesome/lib/shifty.lua"
  install -Dm644 "example.rc.lua" "${pkgdir}/etc/xdg/awesome/shifty.rc.lua"
}

