# Maintainer: MasketLP
pkgname=shan-shui-wallpaper-bin
_pkgname=shan-shui-wallpaper
pkgver=0.2.1
pkgrel=1
pkgdesc='Endless Chinese landscape painting that slowly scrolls across your Wayland desktop (release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/EldinBegano/shan-shui-wallpaper'
license=('MIT')
depends=('glibc' 'libgcc')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-linux.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-linux.tar.gz")
sha256sums_x86_64=('cd2e06906fb3307693219f120490262356173bde479721fb7d2c81c21d98d987')
sha256sums_aarch64=('1eea8f91262ecd1489368026ce5fb7862e1fb7cba8053825ddabfba3251881a6')

package() {
  cd "$_pkgname-$pkgver-$CARCH-linux"
  install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgname.service" -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
