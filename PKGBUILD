# Maintainer: Felip Manyer i Ballester <archlinux at res hyphen telae dot cat>
# Contributor: Maxwell Pray <synthead@gmail.com>
# Contributor: Martin Minka <Martin dot minka at gmail dot com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Author: Peter Odding <peter at peterodding dot com>

pkgname=vim-session
pkgver=2.13.1
pkgrel=3
pkgdesc="Extended session management for Vim (:mksession on steroids)"
url="https://github.com/xolox/vim-session"
arch=("any")
license=("MIT")
depends=("vim-misc-xolox")
source=(
  "https://github.com/xolox/vim-session/archive/refs/tags/$pkgver.tar.gz"
  https://patch-diff.githubusercontent.com/raw/xolox/vim-session/pull/155.patch
)
sha256sums=(
  "827dc571b22d8f6bce4da6a939950164a915894781444920cda07dd5113df29c"
  "eaf6a9775262f2cd259a1e64cc5ae01efd67570bf0c5a1b48ed9d1651382a2cf"
)

prepare() {
  patch -d "$srcdir/vim-session-$pkgver" -p1 < "$srcdir/155.patch"
}

package() {
  mkdir -p "$pkgdir/usr/share/vim/vimfiles"
  cp -r "$srcdir/vim-session-$pkgver/"{autoload,plugin,doc} "$pkgdir/usr/share/vim/vimfiles"
}