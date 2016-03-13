# Maintainer: Wolfgang Popp mail@wolfgang-popp.de
pkgname=ytcc
pkgver=1.2.0
pkgrel=1
pkgdesc="The YouTube channel checker"
arch=('any')
url="https://github.com/popeye123/ytcc"
license=('GPL3')
depends=('python' 'python-lxml' 'python-feedparser' 'mpv' 'youtube-dl')
makedepends=()
source=("https://github.com/popeye123/ytcc/archive/v${pkgver}.tar.gz")
sha1sums=('7189b3fb29dd464861f0a8d6b02ea109b431ed92')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/completions/ytcc.fish"
}

# vim:set ts=2 sw=2 et:
