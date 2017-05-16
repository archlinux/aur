# Maintainer: emersion

pkgname="bups"
pkgver=0.8.1
pkgrel=2
pkgdesc="Simple GUI for Bup, a very efficient backup system."
arch=("any")
url="https://github.com/emersion/bups"
license=("MIT")
depends=("bup" "gtk3" "gobject-introspection" "python2-gobject")
optdepends=("cifs-utils: samba filesystems support"
            "encfs: encryption support"
            "x11-ssh-askpass: encryption support"
            "sshfs: ssh filesystems support"
            "google-drive-ocamlfuse: google drive support"
            "systemd: backup scheduling support")
makedepends=()
source=(
  "https://github.com/emersion/bups/archive/v$pkgver.tar.gz")
sha256sums=('2ae93998f8e5a2e4dc4fddf2e5662017f563c56a2a0d87b10533dd97600b35c7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  bash tools/makemo.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
