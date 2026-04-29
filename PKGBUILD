# Maintainer: Bogdan Szabo <bogdan@re-cinq.com>
#
# This PKGBUILD is auto-updated by release.lash on each tagged release.
# pkgver and sha256sums are replaced; everything else stays put.

pkgname=lash-shell-bin
pkgver=0.12.0
pkgrel=1
pkgdesc="Dual-grammar shell and scripting language with debugger, LSP, and monitor"
arch=('x86_64')
url="https://lash.szabobogdan.com/"
license=('MIT')
depends=('glibc')
provides=('lash' 'lash-shell')
conflicts=('lash' 'lash-shell')
options=('!strip' '!debug')
source=("https://gitlab.com/szabobogdan3/lash/-/releases/v${pkgver}/downloads/lash-shell-${pkgver}-1-x86_64.pkg.tar.zst")
sha256sums=('be8529ed16b4f18a05d82548d8c3e311741aff7cf3462f988376df63c67afb5f')

package() {
  cd "$srcdir"
  bsdtar -xf "lash-shell-${pkgver}-1-x86_64.pkg.tar.zst" -C "$pkgdir"
  # Strip Arch metadata from the wrapped pkg — makepkg generates its own.
  rm -f "$pkgdir/.PKGINFO" "$pkgdir/.MTREE" "$pkgdir/.BUILDINFO" "$pkgdir/.INSTALL"
}
