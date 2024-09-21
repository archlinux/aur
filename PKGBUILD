# Maintainer: Siddhesh Dharme <siddheshdharme18@gmail.com>
# Contributor: Marco Rubin <marco.rubin@protonmail.com>

pkgname=shaq
pkgver=0.0.5
pkgrel=1
pkgdesc='A bare-bones Shazam CLI client'
arch=(any)
url='https://github.com/woodruffw/shaq'
license=('MIT')
depends=('python>=3.10'
         'python-pyaudio>=0.2.13'
         'python-pydub>=0.25.1'
         'python-rich>=13.4'
         'python-shazamio>=0.6.0')
makedepends=(python-build 'python-flit-core>=3.2' python-installer python-wheel)
source=("$url/archive/v$pkgver.tar.gz")
b2sums=('4ab97687337cea0486081e4f68ba155d305fcdd75fec40f931f5d2adfdf75a43e48c8f909838fa3ffffac98313b4f1f4d0523111ac9169c564b3ea250e1b4189')

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
