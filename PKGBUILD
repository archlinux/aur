# Maintainer: Andri Viðar Tryggvason <packager@arivarton.com>
pkgname=mtorrentd
pkgver=0.3.3
pkgrel=2
pkgdesc='Search torrent websites and download .torrent files in terminal.'
arch=('any')
url='https://github.com/arivarton/mtorrentd'
license=('GPL3')
depends=('python3'
         'python-yaml'
         'python-requests'
         'python-beautifulsoup4'
        )
source=("$pkgname-$pkgver.tar.gz"::https://github.com/arivarton/mtorrentd/archive/v"$pkgver".tar.gz)
sha256sums=('602589b910b508577b11dc646e507ff4abbb128e83e9a18e3a13934ebdca1643')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir/"
    install -Dm755 mtorrentd.py "${pkgdir}/usr/bin/mtorrentd"
}
