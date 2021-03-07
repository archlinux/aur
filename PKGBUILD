pkgname=gnome-shell-extension-hide-activities-git
_pkgname=${pkgname%-git}
pkgver=master.r11.2180572
pkgrel=1
pkgdesc="A simple GNOME Shell extenstion to hide the Activities button from the status bar"
arch=('any')
url="https://github.com/zeten30/HideActivities"
license=('Unlicense')
depends=('gnome-shell')
makedepends=('git' 'zip')
source=("${_pkgname}::git+https://github.com/zeten30/HideActivities")
md5sums=('SKIP')
_extdir="usr/share/gnome-shell/extensions/Hide_Activities@zeten30.gmail.com"

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "%s.r%s.%s" "master" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  make release
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/${_extdir}"
  ls -l
  unzip "*.zip" -d "$pkgdir/${_extdir}"
}
