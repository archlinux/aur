# Maintainer: oozyslug <oozyslug@gmail.com>
# Contributor: Shizeeg Unadequatov <shizeeque@gmail.com>
pkgname=gedit-rust-git
pkgver=20150612
pkgrel=1
pkgdesc="Rust syntax highlighting for Gedit."
arch=('i686' 'x86_64')
url='https://github.com/rust-lang/gedit-config'
license=('MIT')
makedepends=('git')
source=("$pkgname::git+https://github.com/rust-lang/gedit-config.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git log -1 --date=short | grep 'Date:' | sed 's|[^0-9]||g'
}

package() {
  mkdir -p "${pkgdir}/usr/share/gtksourceview-3.0/language-specs"
  install -m 644 "${srcdir}/${pkgname}/share/gtksourceview-3.0/language-specs/rust.lang" "${pkgdir}/usr/share/gtksourceview-3.0/language-specs/rust.lang"
}
