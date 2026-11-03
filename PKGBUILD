# Maintainer: aaaa0ggMC <lovelinux@yslwd.eu.org>
# Contributor: krn1pnc <krn1pnc@outlook.com>

pkgname=open-bingyan-bin
pkgver=0.3.1
pkgrel=1
url="https://github.com/BingyanStudio/open-bingyan-bin"
pkgdesc='Bingyan platform CLI for agents and scripts'
arch=('x86_64')
license=('custom:Proprietary')
optdepends=(
  'gnome-keyring: Store login credentials in the system keyring'
  'kwallet: Store login credentials in KWallet'
)
options=('!strip' '!debug')

source=('LICENSE')
sha256sums=('7251da0057daf0971adbc2a637697253e7a4c836dcbe94333392f0caba00eda1')

_asset="bingyan_${pkgver}_linux_x86_64.tar.gz"
source_x86_64=("${_asset}::${url}/releases/download/v${pkgver}/${_asset}")
sha256sums_x86_64=('2614ad92cd57baf61fed71c10e02fac621e89f66287ad874933dd7b3944dcc0c')

package() {
  # 安装 CLI 和许可文件。
  # Install the CLI and the license file.
  install -Dm755 "$srcdir/bingyan" "$pkgdir/usr/bin/bingyan"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
