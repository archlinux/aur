# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.7.3
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'python-dateutil' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('31bebbbe2ac7c1a91ed858af8b8fbd971348e29e318b7e8eda51ebacabbb1742')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
