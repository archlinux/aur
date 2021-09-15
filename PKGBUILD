# Maintainer: Funami
pkgname=htmlq-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="Like jq, but for HTML"
arch=('x86_64')
url="https://github.com/mgdm/htmlq"
license=('MIT')
provides=('htmlq')
conflicts=('htmlq')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mgdm/htmlq/releases/download/v$pkgver/htmlq-x86_64-linux.tar.gz"
        "$pkgname-$pkgver-LICENSE.md::https://raw.githubusercontent.com/mgdm/htmlq/v$pkgver/LICENSE.md")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('cfd8a871b8f3c3921c8b4c943806704cf058af1691248cce382885e8f8ce025f'
            'd456ecab8c75cb216100cf7eddb0d6c672e123884745a4ce8d4962496c2f904f')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  /usr/bin/bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE.md" "$pkgdir/usr/share/licenses/htmlq/LICENSE.md"
  
  cd "$pkgname-$pkgver"
  install -Dm755 htmlq -t "$pkgdir/usr/bin"
}
