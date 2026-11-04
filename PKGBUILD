# Maintainer: LuYishan <wuming381907 at gmail dot com>
pkgname=lunadash-shell
_commit=61c97b8ff279f0b597d2eac683c10cd78b98240b
pkgver=0.r14.g61c97b8
pkgrel=1
pkgdesc='LunaDash session shell (panel, dock, launcher, dashboard) written in Slint and run by SlintLu'
arch=('any')
url='https://github.com/LunaDashWM/LunaDash-Shell'
license=('GPL-3.0-only')
depends=('slintlu' 'sh')
makedepends=('bash')
checkdepends=('slintlu')
source=("$pkgname-$_commit.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('ffe6672240b79357dbeaef805b76d228525fdb3b2bf431b9db75b5c780369bb6')

check() {
  cd "LunaDash-Shell-$_commit"
  slintlu check . >/dev/null
}

package() {
  cd "LunaDash-Shell-$_commit"
  bash ./install.sh --prefix /usr --destdir "$pkgdir" --no-check
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
