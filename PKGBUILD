# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.3.6'
pkgrel=1
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/a0/48/acc8ffaa9414d55ac7c205b5680137b41a6c8d7843fcd00116d1e749d560/pyazo_cli-0.3.6-py3-none-any.whl')
sha256sums=('6f7c7b3dab53178ce49cd34724b9190140ae56964cb32c890d2ec8ed3df23af1')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
