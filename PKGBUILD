# Maintainer: Ada <ada@timfalken.com>
# CI (desktop/packaging/aur/publish.sh) zet pkgver, _tag en sha256sums.
pkgname=kluis-bin
pkgver=0.1.2
pkgrel=1
_tag=v0.1.2
pkgdesc='Kluis: wachtwoorden zoeken en kopiëren met je SSH-sleutel (tray-app en CLI)'
arch=('x86_64')
url='https://projects.timfalken.com/kluis'
_repo='https://git.timfalken.com/projects-timfalken-com/kluis'
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'glibc' 'gcc-libs')
optdepends=('openssh: ssh-agent en sleutels')
provides=('kluis')
conflicts=('kluis')
options=('!strip' '!debug')
source=("kluis-${_tag}-x86_64-linux.tar.gz::${_repo}/-/releases/${_tag}/assets/kluis-${_tag}-x86_64-linux.tar.gz")
sha256sums=('211eb67620b5cb51b45a4549dcde52becc1b8a87049effd9c2d060a755af9b21')

package() {
  cp -a "$srcdir/usr" "$pkgdir/"
  chmod 755 "$pkgdir/usr/bin/kluis"
}
