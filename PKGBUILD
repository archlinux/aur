# Maintainer: Snowy Fluffy <snowy.lnnk@gmail.com>
pkgname=thronectl-bin
_pkgname=thronectl
_reponame=Throne-api
pkgver=0.4.0
pkgrel=1
pkgdesc='Command-line tool and web UI for the Throne API (control Throne from scripts) (prebuilt)'
arch=('x86_64' 'aarch64')
url='https://github.com/throneproj/Throne-api'
license=('MIT')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-arm64.tar.gz")
sha256sums_x86_64=('3abe76f9c2499b4bc0a6e91ffedb2d01eb68e6317674bc7cedde1de60480553c')
sha256sums_aarch64=('3ae93f41a5c9e4ec30c9c975b8ce318bed30e1cec7e2f7e77ea14f75c956f5ca')

package() {
  cd "$_pkgname-v$pkgver-linux-$([[ $CARCH == aarch64 ]] && echo arm64 || echo amd64)"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
