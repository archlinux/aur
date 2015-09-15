# Maintainer: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
_author=tony
_abbrev_commit=c5244c4
pkgname=tmuxp
pkgver=0.9.1
pkgrel=1
pkgdesc="Manage tmux workspaces from JSON and YAML, pythonic API, shell completion."
arch=(any)
url="https://github.com/tony/tmuxp"
license=('BSD')
depends=('python' 'python-argcomplete' 'python-kaptan' 'python-colorama')
options=(!emptydirs)
source=("https://github.com/tony/tmuxp/archive/v${pkgver}.tar.gz")
md5sums=('d103d9d49a2282059c21f95d4d3ef11d')

package() {
  # Use find because github packs sources into a dir named
  # user-repo-commit_sha.
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
