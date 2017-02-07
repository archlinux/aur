# Maintainer: Ray Song <i at maskrayme dot me>

pkgname=telegramircd-git
_pkgname=telegramircd
pkgver=r30.54148e7
pkgrel=1
pkgdesc="IRC server capable of controlling web.telegram.org"
arch=('i686' 'x86_64')
url="https://github.com/MaskRay/telegramircd"
license=('MIT')
depends=('python-aiohttp')
optdepends=("python-ipython: pretty error messages with the '-d' option")
makedepends=('git')
provides=('telegramircd')
conflicts=('telegramircd')
source=('git+https://github.com/MaskRay/telegramircd.git' install)
install=install
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -D "$_pkgname/telegramircd.py" "$pkgdir/usr/bin/telegramircd"
  install -Dm644 "$_pkgname/telegramircd.service" -t "$pkgdir/usr/lib/systemd/system/"
}
