# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=jupyter_latex_envs
pkgver=1.4.4
pkgrel=2
pkgdesc='Jupyter notebook extension which supports (some) LaTeX environments within markdown cells'
arch=(any)
url=https://github.com/ipython-contrib/$_gitname
license=(BSD)
makedepends=()
depends=(python jupyter jupyter-notebook)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('b0a83e0cda2d33e61c4b2da94365d2de4dfcdc1ed67abdba3cbe390872cf5231')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
	chmod 644 "$pkgdir/usr/lib/python3.7/site-packages/latex_envs/static/envsLatex.js"
}
