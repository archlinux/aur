# Maintainer: asm0dey <pavel.finkelshtein+AUR@gmail.com>

pkgname=ipython-7
pkgver=7.3.0
pkgrel=1
pkgdesc="IPython provides a rich toolkit to help you make the most of using Python interactively"
url="https://ipython.readthedocs.io/en/stable/"
arch=(any)
license=('BSD')
depends=(
    'python'
    'python-prompt_toolkit'
    'python-pygments'
    'python-traitlets'
    'python-pickleshare'
    'python-decorator'
    'python-jedi'
    'python-backcall'
)
provides=('ipython' 'ipython-7')
conflicts=('ipython')
makedepends=('python-setuptools')
source=("https://github.com/ipython/ipython/releases/download/$pkgver/ipython-$pkgver.tar.gz")
md5sums=('d12de3bf8fdf9997f9cda81d55b6ce6a')

build() {
    cd "${srcdir}/ipython-$pkgver"
    python setup.py build
}

package() {
    cd "${srcdir}/ipython-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -D --mode 644 --target-directory "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}

