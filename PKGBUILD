# Maintainer: Christopher McAdams <mca.christopher@gmail.com>
pkgname="gnome-shell-extension-night-shift-git"
pkgver=r48.bd29331
pkgrel=2
pkgdesc="::Rolling release:: Gnome-shell extension to automatically switch themes/modes/styles when the sun sets or sun rises"
arch=('any')
url="https://github.com/christophermca/gnome-shell-extension-night-shift"
license=('GPL-3.0-or-later')
makedepends=('git')
provides=('gnome-shell-extension-night-shift-git'
          'get-sunrise-sunset.service'
          'get-sunrise-sunset.timer'
          'gnome-night-shift.service'
          'gnome-night-shift.timer')
conflicts=('gnome-shell-extension-night-shift-git'
           'gnome-night-shift-git'
           'gnome-mode-shift-git'
           'alacritty-use-theme-with-redshift'
           'alacritty-use-theme-with-redshift-git')
source=("$pkgname::git+https://github.com/christophermca/gnome-shell-extension-night-shift.git/")
sha256sums=('SKIP')
depends=( 'gnome-shell' )

pkgver() {
   cd "$pkgname"
   printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  echo $PWD
  # options and directives that can be overridden
  pkgdesc="::Rolling release:: Changes gnomes perferred mode based on sunrise/sunset"
  make install
}
