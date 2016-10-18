# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.5.1
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/popeye123/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'python-dateutil' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/popeye123/ytcc/archive/v${pkgver}.tar.gz")
sha1sums=('d9ab8474c65801d4aeafa30ec3bc26a33bdfc865')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
