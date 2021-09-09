# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase="python-arxiv"
pkgname=("python-arxiv")
_module="arxiv"
pkgver=1.4.2
pkgrel=1
pkgdesc="Python wrapper for the arXiv API: http://arxiv.org/help/api/"
url="https://github.com/lukasschwab/arxiv.py"
depends=("python" "python-feedparser" "python-requests")
makedepends=("python-setuptools")
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("87d5045c342ad8e24e2007bdb4d78f43b3d58357274e20d8a1db70c429e8b0ab")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
