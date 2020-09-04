# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.22
pkgrel=2
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'colordiff')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.22.tar.gz')
sha256sums=('8b31aa3fef057386b191430bdc6e0d6ff745c516a699da96117c8d57996b8a8e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 completion/_blinky "$pkgdir/usr/share/zsh/site-functions/_blinky"
}
