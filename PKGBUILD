# Maintainer: Mohammad Hossein Sekhavat <sekhavat17@gmail.com>

pkgbase='python-streamlit'
pkgname=('python-streamlit')
_module='streamlit'
pkgver='0.48.1'
pkgrel=1
pkgdesc="Streamlit: Frontend library for machine learning engineers"
url="https://streamlit.io"
depends=('python')
makedepends=('python-setuptools')
license=('unknown')
arch=('any')
source=("https://files.pythonhosted.org/packages/ba/f4/aec55c04285d3e369c11574f7b95703bb3472ab17f03a488d3f5314cce8b/streamlit-${pkgver}-py2.py3-none-any.whl")
sha256sums=('e2b78bae27fba241110ec5578262d83baecc55dd1089034c7388b5ce5c987cc5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
