# Maintainer: Jelena Dokic <jrubics@hacke.rs>

pkgbase='pyazo-cli'
pkgname=('pyazo-cli')
_module='pyazo_cli'
pkgver='0.4.1'
pkgrel=2
pkgdesc='Pyazo screenshot hosting command line interface'
url='https://github.com/pyazo-screenshot/cli'
depends=('python' 'python-click' 'python-requests' 'python-pyperclip')
makedepends=('python-pip')
license=('BSD')
arch=('any')
source=('https://files.pythonhosted.org/packages/cc/18/c6c425765ffe129ddefb7c05a47b6f9699b7f4ee5fa284ffcfc0e354c90d/pyazo_cli-0.4.1-py3-none-any.whl')
sha256sums=('4eaef83bb199d8981c2c8fb042436ff7d130d573cbdf4e4af87d27e60c806e22')
noextract=(${_module}-${pkgver}-py3-none-any.whl)

package() {
    depends+=()
    pip install --no-deps --ignore-installed --no-cache-dir --prefix="${pkgdir}/usr" "${_module}-${pkgver}-py3-none-any.whl"
    unzip "${_module}-${pkgver}-py3-none-any.whl" "${_module}-${pkgver}.dist-info/licenses/LICENSE"
    install -Dm644 "${_module}-${pkgver}.dist-info/licenses/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
