# Maintainer: noobping <hello@noobping.dev>

pkgname=pypass-git
_pkgname=${pkgname%-git}
pkgver=VERSION
pkgrel=1
pkgdesc="A GTK4 frontend for Password Store written in python"
arch=('any')
url="https://github.com/noobping/${_pkgname}"
license=('GPL')
depends=('python' 'gtk4' 'python-gobject' 'pass' 'pass-otp' 'adwaita-icon-theme')
makedepends=('git')
optdepends=(
  'file: hide invalid files'
)
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"

  install -Dm755 pypass.py "$pkgdir/usr/bin/pypass"
  install -Dm644 pypass.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/com.github.noobping.pypass.svg"
  install -Dm644 pypass.desktop "$pkgdir/usr/share/applications/com.github.noobping.pypass.desktop"
}
