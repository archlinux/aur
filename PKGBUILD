# Maintainer: Andri Viðar Tryggvason <packager@arivarton.com>
pkgname=mtorrentd
pkgver=0.3.4
pkgrel=1
pkgdesc='Search torrent websites and download .torrent files in terminal.'
arch=('any')
url='https://github.com/arivarton/mtorrentd'
license=('GPL3')
depends=('python3'
         'python-setuptools'
         'python-yaml'
         'python-requests'
         'python-beautifulsoup4'
         'libtorrent-rasterbar'
        )
source=("$pkgname-$pkgver.tar.gz"::https://github.com/arivarton/mtorrentd/archive/v"$pkgver".tar.gz)
md5sums=('498ede4ba0cc473c79cc85c9f186e444')

package() {
    cd "${srcdir}/$pkgname-$pkgver"
    python3 setup.py install --prefix=/usr --root="$pkgdir/"
    install -Dm755 mtorrentd.py "${pkgdir}/usr/bin/mtorrentd"
}
