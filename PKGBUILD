# Maintainer: Andri Viðar Tryggvason <packager@arivarton.com>
pkgname=mtorrentd
pkgver=0.3.3
pkgrel=1
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
sha256sums=('87bd2397ba838e1c0ddfceccb190094310273f9fcc9f8290bf2b723e0ed675ed')
package() {
    cd "${srcdir}"
    python3 setup.py install --prefix=/usr --root="$pkgdir/"
    install -Dm755 mtorrentd.py "${pkgdir}/usr/bin/mtorrentd"
}
