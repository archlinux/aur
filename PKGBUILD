# Maintainer: Rafael Just <rafaeljust@proton.me
# I am not affiliated with ani-skip or it's contributors.
pkgname="ani-skip-git"
pkgver=r35.6eaf57a
pkgrel=1
pkgdesc="A script to automatically skip anime opening and ending sequences."
arch=('any')
url="https://github.com/synacktraa/ani-skip"
license=("GPL3")
depends=('grep' 'sed' 'curl' 'fzf' 'mpv')
makedepends=('git')
provides=('ani-skip')
conflicts=('ani-skip')
source=('ani-skip::git+https://github.com/synacktraa/ani-skip.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/ani-skip"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/ani-skip"
  install -Dm755 "./ani-skip" "$pkgdir/usr/bin/ani-skip"
  install -Dm644 "./skip.lua" "$pkgdir/$HOME/.config/mpv/scripts/skip.lua"
}
