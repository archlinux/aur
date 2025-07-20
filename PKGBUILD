pkgname=updaterv2
pkgver=5.0
pkgrel=5
pkgdesc="This is an updater."
arch=('x86_64')
url="https://test.com"
license=('MIT')
depends=('bash' 'jq')
source=("https://github.com/shadowfreddy25551/testpackage/archive/refs/heads/main.zip")
sha256sums=('SKIP')

build() {
  chmod +x "$srcdir/testpackage-main/code.sh"
  chmod +x "$srcdir/testpackage-main/config.sh"
  echo "To run the updater type 'updater'"
  sleep 3
}

package() {
  install -Dm755 "$srcdir/testpackage-main/code.sh" "$pkgdir/usr/bin/updater"
  install -Dm755 "$srcdir/testpackage-main/config.sh" "$pkgdir/usr/bin/updater-config"
}
