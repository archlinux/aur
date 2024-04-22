# Maintainer: Anakojm <https://anakojm.net/about.html>

pkgname='python-krfzf'
_pkgname='krfzf-py'
pkgver=0.0.6
pkgrel=3
pkgdesc="A Pythonic Fzf Wrapper"
arch=('any')
url="https://pypi.org/project/$_pkgname/"
license=('GPL3')
depends=('python>=3.9.0' 'python<4.0.0')
makedepends=('python-build' 'python-poetry' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/e9/d7/95ffa34a64115af4ce3b9b1a4c90477a4ccd3740a8ef51b104ecdd108857/krfzf_py-0.0.6.tar.gz")
sha256sums=('fccf40b6ef4c2c01a69c4771ead927309022b76a385edf7bd6e43ba5bd020429')

build(){
        python -m build --no-isolation --wheel "$srcdir/${_pkgname/-/_}-$pkgver"
}

package(){
        _py=$(python --version)
        _py=${_py%%.*}

        python -m installer --destdir="$pkgdir" \
                "$srcdir/${_pkgname/-/_}-$pkgver/dist/${_pkgname/-/_}-${pkgver%.r*}-py${_py##* }-none-any.whl"
}
