# Maintainer: Felix Laurie von Massenbach <felix@erbridge.co.uk>
pkgname=python-powerline-gitstatus
_module='powerline-gitstatus'
pkgver=1.2.1
pkgrel=1
pkgdesc="A Powerline segment for showing the status of a Git working copy"
arch=('any')
url="https://github.com/jaspernbrouwer/powerline-gitstatus"
license=('MIT')
depends=('python' 'git')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/${_module}/${_module}-${pkgver}.tar.gz")
md5sums=('33194424b3d9268aea7ae4d7f5e313ad')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
