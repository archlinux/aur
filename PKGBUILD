pkgbase='python-git-reviewers'
pkgname=('python-git-reviewers')
_module='git-reviewers'
pkgver='0.13.2'
pkgrel=1
pkgdesc="Suggest reviewers for your git branch"
url="https://github.com/albertyw/git-reviewers"
depends=('python')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/g/git-reviewers/git-reviewers-${pkgver}.tar.gz")
md5sums=('d53504d3fad4a91f48668df9bfa2b14d')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
