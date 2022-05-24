# Maintainer: Joseph Lansdowne <J49137@gmail.com>
pkgname=gw2-tools
pkgver=12
pkgrel=1
pkgdesc="Collection of small Guild Wars 2 tools"
arch=(any)
url=http://ikn.org.uk/tool/gw2-tools
license=(BSD)
depends=(curl jshon parallel)
optdepends=('p7zip: gw2-dpsreport: support non-Zip logs, compress before upload'
            'xclip: gw2-dpsreport: copy result to clipboard')
source=("http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz")
sha1sums=('05f21c09b3bc6ae07182163c26bbca07025417df')

package () {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" prefix=/usr install
    install -D LICENSE "$pkgdir"/usr/share/licenses/gw2-tools/LICENSE
}
