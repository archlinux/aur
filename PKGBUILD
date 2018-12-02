# Maintainer: Matthew Taylor <mtaylor1252dev@gmail.com>

pkgname=mnimi-git
pkgver=1.0.0.r0.gd42ce1c
pkgrel=1
pkgdesc="A simple note taking application written in python. Notes are stored in JSON and can be parsed by other utilities."
arch=("any")
url="https://gitlab.com/ymber/mnimi"
license=("MIT")
depends=("python")
makedepends=("git")
source=("git+https://gitlab.com/ymber/mnimi.git")
sha256sums=("SKIP")

pkgver() {
  cd mnimi
  git describe --long | sed "s/-/.r/;s/-/./"
}

package() {
  install -D -m755 "$srcdir/mnimi/mnimi" "$pkgdir/usr/bin/mnimi"
  install -D -m644 "$srcdir/mnimi/LICENSE" "$pkgdir/usr/share/licenses/mnimi/LICENSE"
}

