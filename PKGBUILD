# Maintainer: Mateen Ulhaq <mulhaq2005+aur at gmail dot com>

pkgbase="python-arxiv"
pkgname=("python-arxiv")
_module="arxiv"
pkgver="0.5.3"
pkgrel=1
pkgdesc="Python wrapper for the arXiv API: http://arxiv.org/help/api/"
url="https://github.com/lukasschwab/arxiv.py"
depends=("python" "python-feedparser" "python-requests")
makedepends=("python-setuptools")
license=("MIT")
arch=("any")
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("9010cf132bcfb67c07bd363c49d519365310f92ac9da1a06509f712798265987")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
