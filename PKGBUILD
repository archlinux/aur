#Maintainer: wirr <ctroxler at gmail dot com>

_pkgname=ws-session
pkgname=${_pkgname}-git
pkgver=292
pkgrel=1
pkgdesc='Session manager for virtual desktops written in bash'
arch=('any')
url="https://github.com/ctx/${_pkgname}"
license=('GPL')
depends=('xdotool' 'xorg-xprop' 'wmctrl')
makedepends=('git')
optdepends=(
  'bspwm: you need at least one supported windowmanager'
  'herbstluftwm: supported wm'
  'i3-wm: supported wm'
  'wingo-git: supported wm'
  'wmii: supported wm'
  'dwb: supported browser'
  'gvim: supported editor'
  'luakit: supported browser'
  'rxvt-unicode: supported terminal emulator'
  'zathura: supported pdf reader'
  'mupdf: supported pdf reader'
  'zsh: supported shell'
  'dmenu: for a menu to open and close sessions'
  'zenity: for a menu to open and close sessions'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git://github.com/ctx/${_pkgname}.git")
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/$_pkgname"
        git rev-list --count HEAD
}

package() {
        cd "$srcdir/$_pkgname"
        echo $pkgdir
        make PREFIX=/usr DESTDIR="$pkgdir" install
}
