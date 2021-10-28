# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>
pkgname=ytcc
pkgver=2.5.2
pkgrel=1
pkgdesc="Command line tool to keep track of playlists"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python-click' 'youtube-dl' 'python-wcwidth')
optdepends=('mpv' 'fzf' 'yt-dlp')
makedepends=('git' 'python-setuptools')
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('587fa2ea6876bb454f25f66340b86486db187c224eecf697af288ee63776b868')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  ln -s "${pkgdir}/usr/bin/ytccf.sh" "${pkgdir}/usr/bin/ytccf"
  install -Dm644 scripts/completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 scripts/completions/bash/ytcc.completion.sh "${pkgdir}/usr/share/bash-completion/completions/ytcc"
  install -Dm644 scripts/completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
  install -Dm644 doc/ytcc.1 "${pkgdir}/usr/share/man/man1/ytcc.1"
}

# vim:set ts=2 sw=2 et:
