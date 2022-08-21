# Maintainer: d3adb5 <me@d3adb5.net>

pkgname=smarky-git
pkgver=0.1.0.r0.g763f93a
pkgrel=1
pkgdesc="A command bookmarks tool made with SQLite."
arch=(i686 x86_64)
depends=(sqlite)
provides=(smarky)
source=(git+https://github.com/d3adb5/smarky)
sha256sums=(SKIP)

pkgver() {
  cd "${srcdir}/smarky"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  local _srcdir="${srcdir}/smarky"
  install --mode 0755 -D --target-directory "${pkgdir}/usr/bin" "${_srcdir}/smarky"
  install --mode 0644 -D --target-directory "${pkgdir}/usr/share/smarky/widgets" \
    "${_srcdir}/zsh"/*
}
