# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.5.0'
pkgrel=2
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-pip')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/0e/97/492e2a6b710616a815a92531b895592290f633d70c60a24152d020d72ebb/pyazo_cli-0.5.0-py3-none-any.whl')
sha256sums=('f66d7dbfbf928898b26ff0c903453cf45b6922db85f65ba9e182a53eacec6adf')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    depends+=()
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/licenses/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
