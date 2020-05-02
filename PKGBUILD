# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=('gitsome')
pkgver='0.8.0'
pkgrel=1
pkgdesc="Supercharged Git/Shell Autocompleter with GitHub Integration"
url="https://github.com/donnemartin/gitsome"
depends=('python' 'python-ply' 'python-prompt_toolkit' 'python-requests'
	 'python-colorama' 'python-click' 'python-pygments' 'python-feedparser'
	 'python-pytz' 'python-docopt' 'python-uritemplate' 'python-numpydoc')
makedepends=('python-setuptools' 'git')
conflicts=('xonsh' 'python-gitsome')
license=('APACHE')
arch=('any')
source=("git+https://github.com/donnemartin/gitsome#tag=${pkgver}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/gitsome"
    python setup.py build
}

package() {
    cd "$srcdir/gitsome"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
