# Maintainer: Phil Schaf <flying-sheep@web.de>
pkgname=jupyter_latex_envs
pkgver=1.4.6
pkgrel=1
pkgdesc='Jupyter notebook extension which supports (some) LaTeX environments within markdown cells'
arch=(any)
url=https://github.com/ipython-contrib/$_gitname
license=(BSD)
depends=(python jupyter jupyter-notebook)
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname/_/-}/$pkgname-$pkgver.tar.gz")
sha256sums=('070a31eb2dc488bba983915879a7c2939247bf5c3b669b398bdb36a9b5343872')

package() {
	cd "$srcdir/$pkgname-$pkgver"
	python setup.py install --root="$pkgdir" --optimize=1 || return 1
	chmod 644 "$pkgdir/usr/lib/$(readlink /usr/bin/python3)/site-packages/latex_envs/static/envsLatex.js"
}
