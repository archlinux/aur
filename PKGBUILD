# Maintainer(s): Derek Porcelli derekp5831@gmail.com

pkgname=lmp
pkgver=1
pkgrel=1
pkgdesc="A lightweight media player script"
arch=('x86_64')
url="https://github.com/derekporcelli/lmp"
license=('GPL')
depends=('python' 'mpv')
source=("git+git://github.com/derekporcelli/lmp.git")
sha256sums=('SKIP')
packager="Derek Porcelli derekp5831@gmail.com"

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -Dm755 "$srcdir/lmp" "$pkgdir/usr/bin/lmp"
    install -Dm644 "$srcdir/lmp.conf" "$pkgdir/etc/lmp/lmp.conf"
}
