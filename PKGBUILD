# Maintainer: tarball <bootctl@gmail.com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=fish-fzf
pkgver=11.0
pkgrel=1
pkgdesc='fzf plugin for Fish'
arch=('any')
url='https://github.com/PatrickF1/fzf.fish'
license=('MIT')
groups=('fish-plugins')
depends=('fish' 'fzf')
optdepends=(
  'fd: search directory'
  'bat: search directory & file preview'
  'git: search git log & status'
)
makedepends=('git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('1b2bb64f18ad41905178804437f4087db0424dd8a063b4b728dc33f2689a2b66')

package() {
  cd "fzf.fish-$pkgver/"
  install -Dvm644 completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
  install -Dvm644 conf.d/*.fish -t "$pkgdir/usr/share/fish/vendor_conf.d/"
  install -Dvm644 functions/*.fish -t "$pkgdir/usr/share/fish/vendor_functions.d/"
  install -Dvm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dvm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
