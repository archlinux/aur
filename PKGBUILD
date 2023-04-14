# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@protonmail.com>
pkgname=podman-desktop-bin
pkgver=0.14.1
pkgrel=1
epoch=
pkgdesc="Manage Podman and other container engines from a single UI and tray"
arch=("x86_64")
url="https://github.com/containers/podman-desktop"
license=("Apache-2.0")
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=("podman-desktop")
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/containers/podman-desktop/releases/download/v$pkgver/podman-desktop-$pkgver.tar.gz"
    "icon.svg"
    "podman-desktop.desktop"
    "run.sh"
)
sha256sums=("7ea7052ffbfc44a367ea4996e0437c0caa4dca35f15ed076775974ee74cf5510"
            "81b78c485c38dd79b50a8008e148509a95fcc56477592315ab7354b64566315a"
            "f07b6315111ad354ed76fdd6dde37deb704fbe559fc226edb60db23efa02d151"
            "64d7035a78ab85b61129f311dacae5d23b43e79588f06db053b922c9d04e200a"
)
noextract=()
validpgpkeys=()

package() {
  mkdir -p "$pkgdir/opt/$pkgname"
  mkdir -p "$pkgdir/usr/share/applications"
  install -Dm444 $srcdir/icon.svg "$pkgdir/usr/share/$pkgname/icon.svg"
  install -Dm755 $srcdir/podman-desktop.desktop "$pkgdir/usr/share/applications/"

  install -Dm755 $srcdir/run.sh "$pkgdir/usr/bin/podman-desktop"

  cd $srcdir

  cp -a "$srcdir/podman-desktop-$pkgver/." "$pkgdir/opt/$pkgname/"
  chmod 755 "$pkgdir/opt/$pkgname"

  return 0
}
