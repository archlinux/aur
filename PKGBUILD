# Maintainer: Steven Braun <steven.braun.mz@gmail.com >
pkgname=audamo
pkgver=1.1.1
pkgrel=1
pkgdesc="Audamo is an auto dark mode tool that sets light and dark mode themes based on time or location."
arch=('any')
url="https://www.steven-braun.com/audamo"
license=('MIT')
depends=('python' 'python-requests' 'python-astral' 'python-tomli')

source=("git+https://github.com/braun-steven/audamo.git#tag=v$pkgver")
md5sums=('SKIP')

package() {
  # Install the script and other files
  cd "$pkgname"
  install -Dm755 audamo.py "$pkgdir/usr/bin/audamo"
  install -Dm644 config.toml "$pkgdir/usr/share/audamo/config.toml"
  install -Dm644 audamo.service "$pkgdir/usr/lib/systemd/user/audamo.service"
}
