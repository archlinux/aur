# Maintainer(s): Derek Porcelli derekp5831@gmail.com

pkgname=lmp
pkgver=r14.2fb928a
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
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
    install -Dm755 "$srcdir/lmp" "$pkgdir/usr/bin/lmp"
    install -Dm644 "$srcdir/lmp.conf" "$pkgdir/etc/lmp/lmp.conf"
}
