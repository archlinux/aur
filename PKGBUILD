# Maintainer: MingxuanGame <MingxuanGame@outlook.com>
# Maintainer: serverbread <serverbread-DEV@qq.com>
pkgname="meowpad-configurator-v2-bin"
pkgver="1.2.0"
pkgrel=1
pkgdesc="Meowpad v2 配置器"
arch=('x86_64')
license=('MIT')
url="https://desu.life/"
depends=(    
  'webkit2gtk-4.1'
  'gtk3'
  'systemd-libs'
  'openssl-1.1'
  'gdk-pixbuf2'
  'gcc-libs'
  'libsoup'
  'glibc'
  'glib2'
  'hicolor-icon-theme'
)
makedepends=(
  'binutils'
)
provides=("meowpad-configurator-v2")
conflicts=("meowpad-configurator-v2" "meowpad-configurator-v2-git")
options=('!emptydirs')
install='udev.install'
source=(
  "MeowpadConifiguratorForV2_v${pkgver}_linux.deb::https://assets.desu.life/device/app/resources/MeowpadConfiguratorForV2_v${pkgver}_linux.deb"
  '52-meowpad.rules'
  'LICENSE::https://raw.githubusercontent.com/desu-life/MeowpadConfigurator/refs/heads/2.0-meowpad/LICENSE'
  'udev.install'
)
sha256sums=(
  'e174530e49cb05d2f08878f05f0e14246198d7e314398601dbba64422ef759e2'
  '5c399802e5cb6e55ab13058e3474ea9c3b67601bdefb5da85061e3628e862428'
  '20572bbf6ce7d98829f48e0281a2109469f6b3068e814d10400066014deee9c5'
  '97ed0869cf8d327096c734d070c588838913c189187f3c439e07dc368b984fde'
)

package(){
  cd "$srcdir"
  ar x "MeowpadConifiguratorForV2_v${pkgver}_linux.deb"
  tar xf data.tar.gz -C "$pkgdir"
  install -Dm 644 "$srcdir/52-meowpad.rules" "$pkgdir"/usr/lib/udev/rules.d/52-meowpad.rules
  install -Dm 644 "LICENSE" "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  rm -rf "$pkgdir/usr/src"
}
