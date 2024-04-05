# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.3.7'
pkgrel=1
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-pip')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/24/59/1b3f2644bfab9681c2dbb2eb26c81f420def81256b314b94ac201714385a/pyazo_cli-0.3.7-py3-none-any.whl')
sha256sums=('56f0711a6f8ef39b5d57ef92c731fae320b3d4e4ad54b487bddf5cd96c37b134')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    depends+=()
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
