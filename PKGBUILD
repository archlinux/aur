# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.8.2
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'python-sqlalchemy' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('360db561bb0278b7f326fe3da9b012e738e1eceec9031c66b3749207f8091283')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
