# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.8.1
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'python-sqlalchemy' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('e3c27a915182c5ee9314cb22ed19bd26847b4521c369d85a790408e0cdbd691e')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
