# Maintainer: Dolores Portalatin <meskarune at gmail dot com>
# Contributor: burntcookie90 <aur at vishnurajeevan dot com>
_gitname=i3lock-fancy
pkgname=i3lock-fancy-git
pkgver=r161.7217cb5
pkgrel=1
pkgdesc="i3lock-color script: blurs background, adds lock icon and text, offers dark/light background detection."
arch=('i686' 'x86_64')
url="https://github.com/meskarune/i3lock-fancy"
license=('MIT')
depends=('coreutils' 'awk' 'bash' 'util-linux' 'imagemagick' 'i3lock')
optdepends=('wmctrl: minimize windows before locking'
            'scrot: alternative screenshot creator'
            'maim: alternative screenshot creator'
            'gnome-screenshot: alternative screenshot creator')
makedepends=('git')
provides=('i3lock-fancy')
source=("git+https://github.com/meskarune/$_gitname.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${srcdir}/$_gitname"
    DESTDIR="$pkgdir" make install
}
