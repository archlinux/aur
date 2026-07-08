# Maintainer: MingxuanGame <MingxuanGame@outlook.com>
pkgname="prismterminal"
pkgver=1.1.24
pkgrel=1
pkgdesc="棱镜终端 -- Meowpad 下一代配置器"
arch=('x86_64')
license=('unknown')
url="https://kagamistudio.com/"
depends=('webkit2gtk-4.1' 'gtk3' 'openssl' 'systemd-libs' 'hicolor-icon-theme')
makedepends=(
  'binutils'
)
provides=("prismterminal")
options=('!emptydirs')
install='udev.install'
source=(
  "PrismTerminal_v${pkgver}.deb::https://support.kagamistudio.com/uploads/downloads/PrismTerminal/PrismTerminal-v1.1.24-linux64-c746ea2c9b9143ae86214b550f86898a.deb"
  '70-prismterminal-hid.rules'
  'udev.install'
)
sha256sums=('ad544134474fc831f835242171992a9b9a2f3245ee40802a111a1f79e1e5022c'
  '5c399802e5cb6e55ab13058e3474ea9c3b67601bdefb5da85061e3628e862428'
  '97ed0869cf8d327096c734d070c588838913c189187f3c439e07dc368b984fde')

package(){
  cd "$srcdir"
  ar x "PrismTerminal_v${pkgver}.deb"
  tar xf data.tar.gz -C "$pkgdir"
  install -Dm 644 "$srcdir/70-prismterminal-hid.rules" "$pkgdir"/usr/lib/udev/rules.d/70-prismterminal-hid.rules
  rm -rf "$pkgdir/usr/src"
}
