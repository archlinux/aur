# Maintainer: emersion

pkgname="bups"
pkgver=0.8.0
pkgrel=2
pkgdesc="Simple GUI for Bup, a very efficient backup system."
arch=("any")
url="https://github.com/emersion/bups"
license=("MIT")
depends=("bup" "gtk3" "gobject-introspection")
optdepends=("cifs-utils: samba filesystems support"
            "encfs: encryption support"
            "sshfs: ssh filesystems support"
            "google-drive-ocamlfuse: google drive support"
            "systemd: backup scheduling support")
makedepends=()
source=(
  "https://github.com/emersion/bups/archive/v$pkgver.tar.gz")
sha256sums=('f74bf561dcea85e3dcb8860ac6f07005011173438a4b52be4ebf5b33ba4862ff')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  bash tools/makemo.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
