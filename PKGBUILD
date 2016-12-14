# Maintainer: Dylan Baker <dylan@pnwbakers.com>
pkgname=pybugz
pkgver=0.13
pkgrel=1
pkgdesc="Bugzilla CLI interface"
arch=('any')
url="https://github.com/williamh/pybugz"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://github.com/williamh/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a99309d42b7ed2e52cc0f0f3adc72d1ddc9354e3d944af276f9a7da946665afb')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -D -m644 "contrib/bash-completion" \
    "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
  install -D -m644 "contrib/zsh-completion" \
    "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"
}

# vim:set ts=2 sw=2 et:
