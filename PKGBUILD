pkgbase='textshot'
pkgname='textshot'
_module='textshot'
pkgver='0.1.1'
pkgrel=1
pkgdesc="Python tool for grabbing text via screenshot"
url=""
depends=('python' 'python-pillow' 'python-pyqt5' 'python-pyqt5-sip'
'python-py-notifier' 'python-pyperclip' 'python-pytesseract')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('325badc530c504da744b686184cbdc12a8a5690676fd67a894f8d593c8e4fb34')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python3 -m build --wheel --no-isolation


}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
