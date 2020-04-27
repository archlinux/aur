# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='twint'
pkgname=('twint')
_module='twint'
pkgver='2.1.19'
pkgrel=1
pkgdesc="An advanced Twitter scraping & OSINT tool."
url="https://github.com/twintproject/twint"
depends=('python' 'python-aiohttp' 'python-aiodns' 'python-beautifulsoup4' 'python-cchardet' 'python-elasticsearch' 'python-pysocks' 'python-pandas' 'python-geopy' 'python-googletransx' 'python-schedule' 'python-fake-useragent' 'python-aiohttp-socks')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('61ff7f4e4b55cedfa36c65c7981638733ac2ad948db0dae9de07701013b40a72')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
