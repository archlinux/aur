pkgbase='python-xpinyin'
pkgname=('python-xpinyin')
_module='xpinyin'
pkgver='0.7.6'
pkgrel=1
pkgdesc="Translate Chinese hanzi to pinyin (拼音) by Python, 汉字转拼音"
url="https://github.com/lxneng/xpinyin"
depends=('python')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('dec6aa0f4d9f9b6788d8131245293f1951180333a6d474b467b2d556221862fe')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
