
pkgname=python-humblebundle-downloader
pkgver=0.4.0
pkgrel=1
pkgdesc="Download all of your content from your Humble Bundle Library!"
arch=('x86_64')
url="https://github.com/xtream1101/humblebundle-downloader"
license=('MIT')
makedepends=('python-setuptools')
depends=('python' 'python-parsel')
source=("https://github.com/xtream1101/humblebundle-downloader/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('b8cf7b131df3298a51a682294835dc20c90a5a092dba4c3a0549b59d20f38201')

build() {
    cd humblebundle-downloader-"$pkgver"
    python setup.py build
}

package() {
    cd humblebundle-downloader-"$pkgver"
    python setup.py install --root="$pkgdir" --prefix=/usr --skip-build
}
