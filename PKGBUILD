# Maintainer: mh4ckwascut <mh4ckt3mh4ckt1c4s@archlinux.org>
# Maintainer: LekkerKofi <arch at myusername dot com>
# Contributor: Juliette Cordor

pkgname=podman-desktop-bin
pkgver=1.17.1
pkgrel=1
pkgdesc="Manage Podman and other container engines from a single UI and tray"
arch=("x86_64")
url="https://podman-desktop.io"
license=("Apache-2.0")
provides=("podman-desktop")
conflicts=("podman-desktop")
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/podman-desktop/podman-desktop/releases/download/v$pkgver/podman-desktop-$pkgver.tar.gz"
    "icon.svg"
    "podman-desktop.desktop"
    "run.sh"
)
sha256sums=('d3f34c60e0feed41f3cae9f9bfb31a18d3fc84ac5720bb3c51243aefed7f18a1'
            '81b78c485c38dd79b50a8008e148509a95fcc56477592315ab7354b64566315a'
            'f07b6315111ad354ed76fdd6dde37deb704fbe559fc226edb60db23efa02d151'
            '64d7035a78ab85b61129f311dacae5d23b43e79588f06db053b922c9d04e200a')

package() {
  install -Dm444 icon.svg "$pkgdir/usr/share/$pkgname/icon.svg"
  install -Dm755 podman-desktop.desktop "$pkgdir/usr/share/applications/podman-desktop.desktop"

  install -Dm755 run.sh "$pkgdir/usr/bin/podman-desktop"

  install -d "$pkgdir/opt/$pkgname"
  cp -a "$srcdir/podman-desktop-$pkgver/." "$pkgdir/opt/$pkgname/"
}
