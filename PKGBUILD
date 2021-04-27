# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>

pkgname=vim-mkdx
pkgver=1.10.0
pkgrel=1
pkgdesc="Vim plugin that adds Markdown-related features"
arch=('any')
url="https://github.com/sidofc/mkdx"
license=('MIT')
groups=('vim-plugins')
depends=('vim-plugin-runtime')
optdepends=('vim-repeat: Compatible plugin')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "https://raw.githubusercontent.com/sidofc/mkdx/v$pkgver/CHANGELOG.md")
sha256sums=('acc09a8367aab71baa292f5cf0a81e587ee01a150e7c027eb99d9079ec1e0977'
            'ec5c9cbb3b71abb57738b4db098143e497ac0ea16b96275e6cc3daca07916d5f')

package() {
  cd "mkdx-$pkgver"
  find after autoload doc ftplugin plugin ! -name '*.gif' \
    -type f -exec install -Dvm 644 '{}' "$pkgdir/usr/share/vim/vimfiles/{}" \;
  install -Dvm 644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dvm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
