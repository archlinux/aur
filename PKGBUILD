# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.5.2'
pkgrel=2
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-pip')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/13/34/571137ff6775ac65f2f4333b272547b22d539b373b3baa4b29571e6b86c2/pyazo_cli-0.5.2-py3-none-any.whl')
sha256sums=('7e699b36d37df50c56d53ad2d4057c7cf1d485516e7776db86b52092370ee190')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    depends+=()
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/licenses/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
