# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.1.1
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/popeye123/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/popeye123/ytcc/archive/v${pkgver}.tar.gz")
md5sums=('a87db39a1679d507af84b94cbe02e364')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
}

# vim:set ts=2 sw=2 et:
