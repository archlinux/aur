# Maintainer: ZappaBoy <federico.zappone at justanother dot group>
pkgname=xborder-git
pkgbase=xborder-git
pkgver=1.0.0
pkgrel=2
pkgdesc="Active window border replacement for window managers."
arch=('any')
url="https://github.com/deter0/xborder"
license=('The Unlicense')
depends=('libwnck3' 'gtk3' 'python' 'python-cairo')
makedepends=('git')
provides=('xborders')
source=('git+https://github.com/deter0/xborder')
md5sums=('SKIP')


instructions() {
  /bin/cat << EOF
If you use a compositor with blur feature enabled please make sure to exclude 'xborder' from it.

Example:
If you are using picom compositor add the 'xborder' role at blur-blackground-exclude linke following:

   blur-background-exclude = [
      # prevents picom from blurring the background
      "role   = 'xborder'",
      ...
   ];

EOF
}

package() {
  cd "$srcdir/xborder/"
  chmod +x "xborders"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
  install -Dm755 xborders "$pkgdir/usr/bin/xborders"
  instructions
}

# vim:set ts=2 sw=2 et:
