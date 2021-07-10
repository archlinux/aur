# Maintainer: novenary <streetwalkermc@gmail.com>

pkgname=metalfan-git
pkgver=r3.cf19af1
pkgrel=1
pkgdesc="Fan control script"
arch=('any')
url="https://github.com/9ary/metalfan"
license=('MIT')
depends=('python' 'python-attrs' 'python-toml')
source=("git+https://github.com/9ary/metalfan.git")
sha256sums=('SKIP')
backup=('etc/metalfan.toml')

pkgver() {
  cd "${srcdir}/metalfan"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/metalfan"

  install -Dm 644 metalfan.service $pkgdir/usr/lib/systemd/system/metalfan.service
  install -Dm 644 metalfan.toml $pkgdir/etc/metalfan.toml
  install -Dm 755 metalfan.py $pkgdir/usr/bin/metalfan
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/metalfan-git/LICENSE
}

# vim:set ts=2 sw=2 et:
