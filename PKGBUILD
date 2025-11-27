# Maintainer: Nicola Demo <demo.nicola@gmail.com)

pkgname=goodday-desktop-bin
pkgver=7.0.1
pkgrel=1
pkgdesc="GoodDay Work desktop client (binary .deb repackaged)"
arch=('x86_64')
url="https://www.goodday.work"
license=('custom')
depends=('gtk3' 'glib2' 'nss' 'libxss' 'libxtst' 'libnotify' 'libsecret')
source=("https://static.goodday.work/desktop/GoodDay-${pkgver}-Linux.deb")
sha256sums=('5a561511481125ecaf3778b5e43ad062011c410f780a46dc8757c63b636ae13b')

package() {
  cd "$srcdir"

  ar x "GoodDay-${pkgver}-Linux.deb"
  tar -xf data.tar.* -C "$pkgdir"

  if [[ -d "$pkgdir/opt" ]]; then
    install -d "$pkgdir/usr/bin"
    ln -sf /opt/GoodDay/goodday "$pkgdir/usr/bin/goodday"
  fi
}

