# Maintainer: jakka <jakkadoujin at gmail dot com>


pkgname=python-saucenao
_name='saucenao'
_altname='SauceNAO'
pkgver=1.0.6
pkgrel=1
pkgdesc="unofficial python module to make working with SauceNAO in projects easier"
arch=(x86_64 aarch64)
url="https://github.com/DaRealFreak/saucenao"
license=(MIT)
depends=('python-beautifulsoup4' 'python-requests')
optdepends=(
    'python-pillow: Python Imaging Library, used to generate images for unittests'
    'python-dotenv: .env file loader used for unittests'
    'python-requests-mock: requests mock responses used for unittests'
)
source=("https://github.com/DaRealFreak/saucenao/archive/v${pkgver}.tar.gz")
sha512sums=('fc618448a628b396f519ad5b646224858e9a758074bfabe290d0daff509bd084573de100a9bb145b2ef9a8dfe9050cc92a811045ade0399f768b8aa6946b3aaa')

build() {
  cd $srcdir/${_name}-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd $srcdir/${_name}-$pkgver
  python -m installer --destdir $pkgdir $srcdir/${_name}-$pkgver/dist/${_altname}-$pkgver-*.whl
}
