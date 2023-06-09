# Maintainer: Jonas 'cherti' Große Sundrup <aur@letopolis.de>

pkgname=blinky
pkgver=0.23.1
pkgrel=1
pkgdesc="AUR-helper with minimal hassle"
arch=(any)
url="https://github.com/cherti/blinky"
license=('GPLv3')
depends=('python' 'pyalpm' 'python-requests' 'python-termcolor' 'python-pyxdg' 'python-packaging' 'colordiff' 'wget')
optdepends=('libnotify')
options=(!emptydirs)
source=('https://github.com/cherti/blinky/archive/v0.23.1.tar.gz')
sha256sums=('e9f617d9e704203ba8e755f90bd81f5efdb2572a8f868eb859fee21eec259dfd')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 completion/_blinky "$pkgdir/usr/share/zsh/site-functions/_blinky"
}
