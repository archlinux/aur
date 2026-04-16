# Maintainer: ZhX589 ZhX589@outlook.com 
# Contributor: ZhX589 ZhX589@outlook.com 

pkgname=organize-bin
pkgver=2.0.3
pkgrel=1
pkgdesc="File organizer by extension (precompiled binary package)"
arch=('any')
url="https://github.com/yourusername/organize"
license=('MIT')
depends=('bash' 'coreutils')
makedepends=()
provides=("organize")
conflicts=("organize")
source=("$pkgname-$pkgver.tar.gz::https://github.com/yourusername/organize/archive/v$pkgver.tar.gz")
sha256sums=('SKIP')
validpgpkeys=()

package() {
  cd "$srcdir/organize-$pkgver"
  
  # 安装主程序
  install -Dm755 src/organize.sh "$pkgdir/usr/bin/organize"
  
  # 安装默认规则配置
  install -Dm644 config/rules.conf.example "$pkgdir/usr/share/organize/rules.conf.default"
  
  # 安装手册页
  install -Dm644 man/organize.1 "$pkgdir/usr/share/man/man1/organize.1"
  
  # 安装 LICENSE（可选但推荐）
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
