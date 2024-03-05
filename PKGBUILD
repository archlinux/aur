# Maintainer: Steven Braun <steven.braun.mz@gmail.com >
pkgname=audamo
pkgver=1.0.0
pkgrel=1
pkgdesc="Audamon sets light and dark mode themes based on time or location."
arch=('any')
url="https://github.com/braun-steven/audamo/tree/v$pkgver"
license=('MIT')
depends=('python' 'python-toml' 'python-requests' 'python-astral' 'python-timezonefinder' 'python-pytz')

source=("git+https://github.com/braun-steven/audamo.git")
md5sums=('SKIP')

package() {
  # Install the script and other files
  cd "$pkgname"
  install -Dm755 audamo.py "$pkgdir/usr/bin/audamo"
  install -Dm644 config.toml "$pkgdir/usr/share/audamo/config.toml"
  install -Dm644 audamo.service "$pkgdir/usr/lib/systemd/user/audamo.service"
  install -Dm644 audamo.timer "$pkgdir/usr/lib/systemd/user/audamo.timer"
}
