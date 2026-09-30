# Maintainer: arqueon <arqueonautis@gmail.com>
pkgname=dms-shell-plugin-dankmail
pkgver=0.3.10
pkgrel=1
pkgdesc="Dankmail Unread companion for DankMaterialShell (unread counts and mail triage)"
arch=('any')
url="https://github.com/arqueon/dankmail"
license=('GPL-3.0-or-later')
depends=('dankmail' 'dms-shell')
install=dms-shell-plugin-dankmail.install
source=("dankmail-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6cdc6e5641cb58f5a4f15790b7e08e3b6fd2789bf7b5240c7434b2f217a74232')

package() {
  cd "dankmail-$pkgver"
  # DMS discovers packaged plugins here, separately from user-managed copies.
  local plugin_dir=/etc/xdg/quickshell/dms-plugins/dankmailUnread
  install -Dm644 dms-plugin/plugin.json "$pkgdir$plugin_dir/plugin.json"
  install -m644 dms-plugin/*.qml "$pkgdir$plugin_dir/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
