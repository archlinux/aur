# Maintainer: mdraw.gh@gmail.com

pkgname=('python-elektronn2-git')
_gitname='ELEKTRONN2'
pkgver=rev59
pkgrel=1
pkgdesc='A highly configurable toolkit for training 3d/2d CNNs and general Neural Networks'
url='https://github.com/ELEKTRONN/ELEKTRONN2'
depends=(
    'python'
    'python-theano'
    'python-matplotlib'
    'python-h5py'
    'python-numpy'
    'python-scipy'
    'python-numba'
    'python-future'
    'python-tqdm'
    'python-colorlog'
    'python-prompt_toolkit'
    'python-jedi'
    'python-scikit-learn'
    'python-scikit-image'
    'python-seaborn'
    'python-pydotplus'
    'python-psutil'
)
makedepends=('python-setuptools')
conflicts=('python-elektronn2')
license=('GPLv3')
arch=('any')
source=("git://github.com/ELEKTRONN/${_gitname}.git")
md5sums=('SKIP')

pkgver() {
    cd "$_gitname"
    echo "rev$(git rev-list --all --count)"
    #git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${_gitname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
