# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=gnome-shell-extension-impatience-git
_pkgname=gnome-shell-impatience
pkgver=0.4.8.r2.g3123c74
pkgrel=1
pkgdesc="speed up gnome-shell animations"
arch=('any')
url="https://github.com/timbertson/gnome-shell-impatience"
license=('GPL3')
depends=('gnome-shell>=1:40')
makedepends=('git')
conflicts=('gnome-shell-extension-impatience')
provides=('gnome-shell-extension-impatience')
install=gschemas.install
source=(git+$url)
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed -r 's/version-//;s/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname/impatience"

  for i in $(find -type f); do
    install -Dm 644 $i $pkgdir/usr/share/gnome-shell/extensions/impatience@gfxmonk.net/$i
  done
}
