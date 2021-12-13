# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.23
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'python-packaging' 'colordiff' 'wget')
optdepends=('libnotify')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.23.tar.gz')
sha256sums=('a567fb34137faa4d6c448e8ab07a4c4126514cf85f2a25507a01392d45f76c9d')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 completion/_blinky "$pkgdir/usr/share/zsh/site-functions/_blinky"
}
