# Maintainer: MingxuanGame <MingxuanGame@outlook.com>
pkgname="prismterminal"
pkgver=1.1.9
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
  "PrismTerminal_v${pkgver}.deb::https://github.com/Kagami-Studio/PrismTerminal-Release/releases/download/v${pkgver}/PrismTerminal-v${pkgver}-linux64.deb"
  '70-prismterminal-hid.rules'
  'udev.install'
)
sha256sums=('eecd499ebe9295d963d4554d90b1a5ae8ebedec8b590656bf1edd308a0d6b750'
  '5c399802e5cb6e55ab13058e3474ea9c3b67601bdefb5da85061e3628e862428'
  '97ed0869cf8d327096c734d070c588838913c189187f3c439e07dc368b984fde')

package(){
  cd "$srcdir"
  ar x "PrismTerminal_v${pkgver}.deb"
  tar xf data.tar.gz -C "$pkgdir"
  install -Dm 644 "$srcdir/70-prismterminal-hid.rules" "$pkgdir"/usr/lib/udev/rules.d/70-prismterminal-hid.rules
  rm -rf "$pkgdir/usr/src"
}
