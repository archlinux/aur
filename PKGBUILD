# Maintainer: William Coffey <170283204+rewalo@users.noreply.github.com>
# Virtual sinks/sources for RODECaster Duo (Game, System, Chat, Music)

pkgname=rodecaster-duo-pipewire
pkgver=1.0.0
pkgrel=1
pkgdesc="Virtual audio sinks/sources for RODECaster Duo (Game, System, Chat, Music)"
arch=(any)
url="https://github.com/rewalo/rodecaster-duo-pipewire"
license=('MIT')
depends=(pipewire pipewire-pulse pipewire-cli bash)
optdepends=('wireplumber: recommended session manager')
install=rodecaster-duo-pipewire.install
source=(
  '99-rodecaster-duo-virtual-sinks.conf.template'
  '99-rodecaster-duo-virtual-sources.conf.template'
  'install-rcp-duo-pipewire.sh'
  'discover-rcp-devices.sh'
  'rodecaster-duo-set-pro-audio.sh'
  'rodecaster-duo-pipewire.install'
  'LICENSE'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

package() {
  cd "$srcdir"
  install -d "$pkgdir/usr/share/rodecaster-duo-pipewire"
  install -m644 99-rodecaster-duo-virtual-sinks.conf.template \
    "$pkgdir/usr/share/rodecaster-duo-pipewire/"
  install -m644 99-rodecaster-duo-virtual-sources.conf.template \
    "$pkgdir/usr/share/rodecaster-duo-pipewire/"
  install -Dm755 install-rcp-duo-pipewire.sh \
    "$pkgdir/usr/bin/rodecaster-duo-pipewire-install"
  install -Dm755 discover-rcp-devices.sh \
    "$pkgdir/usr/bin/rodecaster-duo-pipewire-discover"
  install -Dm755 rodecaster-duo-set-pro-audio.sh \
    "$pkgdir/usr/bin/rodecaster-duo-set-pro-audio"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}