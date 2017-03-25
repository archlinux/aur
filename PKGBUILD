# Maintainer:  Franklyn Tackitt <aur@tackitt.net>
# Contributor: Artem Bezsmertnyi <artem.bezsmertny@gmail.com>
_author=tony
pkgname=tmuxp
pkgver=1.2.7
pkgrel=1
gitpkgver=v${pkgver}
pkgdesc="Manage tmux workspaces from JSON and YAML, pythonic API, shell completion."
arch=(any)
url="https://github.com/tony/tmuxp"
license=('BSD')
depends=(
  'python'
  'python-click' 
  'python-libtmux>=0.6.4' 
  'python-kaptan' 
  'python-colorama'
)
options=(!emptydirs)
source=("https://github.com/tony/tmuxp/archive/${gitpkgver}.tar.gz")
md5sums=('d5a4690014b1d9c701f5f7299999e0d0')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
