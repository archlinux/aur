# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.7.2
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'python-dateutil' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('9b9503e04d25a1cf03068f907a6fa8ee821030d6e9e03e63849c2f37ed7dd1ca')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
