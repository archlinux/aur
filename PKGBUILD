# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.5.1'
pkgrel=2
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-pip')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/7f/3a/846774d2a08cca508ce8091177d252227473f70bbbe451007660cf6a23b6/pyazo_cli-0.5.1-py3-none-any.whl')
sha256sums=('2385a5ae567a59fb4a6c8dcf38897330933908c50a946dbf889c55f79331243c')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    depends+=()
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/licenses/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
