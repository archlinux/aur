# Maintainer: Dan Elkouby <streetwalrus@codewalr.us>

pkgname=metalfan-git
pkgver=20170319.3ab1274
pkgrel=1
pkgdesc="Fan control script"
arch=('any')
url="https://github.com/Streetwalrus/metalfan"
license=('MIT')
depends=('python' 'python-attrs' 'python-toml')
source=("git+https://github.com/Streetwalrus/metalfan.git")
sha256sums=('SKIP')
backup=('etc/metalfan.toml')

pkgver() {
  cd "${srcdir}/metalfan"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
  cd "$srcdir/metalfan"

  install -Dm 644 metalfan.service $pkgdir/usr/lib/systemd/system/metalfan.service
  install -Dm 644 metalfan.toml $pkgdir/etc/metalfan.toml
  install -Dm 755 metalfan.py $pkgdir/usr/bin/metalfan
  install -Dm 644 LICENSE $pkgdir/usr/share/licenses/metalfan-git/LICENSE
}

# vim:set ts=2 sw=2 et:
