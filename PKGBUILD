# Maintainer: emersion

pkgname="bups"
pkgver=0.7.2
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
md5sums=('a0aa558d9186f4e926fc615620079a76')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  bash tools/makemo.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}
