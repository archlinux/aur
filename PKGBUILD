# Maintainer: orhun <orhunparmaksiz@gmail.com>
# Maintainer: kdheepak <me@kdheepak.com>
# https://github.com/orhun/pkgbuilds

pkgname=taskwarrior-tui-bin
pkgver=0.9.7
pkgrel=1
pkgdesc="A Terminal User Interface for Taskwarrior"
arch=('x86_64')
url="https://github.com/kdheepak/taskwarrior-tui"
license=('MIT')
depends=('task')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}")
source_x86_64=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/${pkgname%-bin}-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE::$url/raw/v$pkgver/LICENSE"
        "$pkgname-$pkgver-README.md::$url/raw/v$pkgver/README.md")
sha256sums_x86_64=('27bcef02f896031aa6f67563edc157a89cb6dba0de656ba6175bb7f7ef6d529f'
                   '0591178e63904cfbcd6c5efc0490d59637aaede5e2e14e79e978a8162981a755'
                   '9a7773cbb2742eb76782f214eec0b231a73ebb9e498b8991034467b08d2a682c')

package() {
  install -Dm 755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
  install -Dm 644 "$pkgname-$pkgver-LICENSE" "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm 644 "$pkgname-$pkgver-README.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
