# Maintainer: Wolfgang Popp <mail@wolfgang-popp.de>
pkgname=ytcc
pkgver=2.6.1
pkgrel=1
pkgdesc="Command line tool to keep track of playlists"
arch=('any')
url="https://github.com/woefe/ytcc"
license=('GPL3')
depends=('python-click' 'yt-dlp' 'python-wcwidth')
optdepends=('mpv' 'fzf' 'youtube-dl')
makedepends=('git' 'python-setuptools')
source=("https://github.com/woefe/ytcc/archive/v${pkgver}.tar.gz")
sha256sums=('abd6d26d8c1a0ad5787cf890b08ddf1cb685c2e26f353abb168da49a40974e3c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  ln -s "ytccf.sh" "${pkgdir}/usr/bin/ytccf"
  install -Dm644 scripts/completions/zsh/_ytcc "${pkgdir}/usr/share/zsh/site-functions/_ytcc"
  install -Dm644 scripts/completions/bash/ytcc.completion.sh "${pkgdir}/usr/share/bash-completion/completions/ytcc"
  install -Dm644 scripts/completions/fish/ytcc.fish "${pkgdir}/usr/share/fish/vendor_completions.d/ytcc.fish"
  install -Dm644 doc/ytcc.1 "${pkgdir}/usr/share/man/man1/ytcc.1"
}

# vim:set ts=2 sw=2 et:
