# Maintainer: Donald Webster <fryfrog@gmail.com>

pkgname=lazylibrarian
pkgver=1.0.1
pkgrel=1
pkgdesc="Automatic Book Downloading via NZBs & Torrent"
arch=('any')
url="https://github.com/DobyTang/LazyLibrarian"
license=('GPL3')
depends=('python2')
install='lazylibrarian.install'
conflicts=('lazylibrarian-git')
provides=('lazylibrarian')

source=("https://github.com/DobyTang/LazyLibrarian/archive/${pkgver}.tar.gz"
        'lazylibrarian.service'
        'lazylibrarian.sysusers')

sha256sums=('dc038d8b5523b870783f368e37bc03e6c9634a5ecdc1ea8bc38a3c8aae608954'
            '5010608e99e0242ba7c74b401efed0968984fd9a0ba1b9995dca22d6b8da8519'
            '1e5ee6265af4e4d8beea3cec49cbdba6624a6169edee081aa03de32965d4729d')

package() {
  install -d -m 755 "${pkgdir}/usr/lib/lazylibrarian"
  cp -dpr --no-preserve=ownership "$srcdir/LazyLibrarian-${pkgver}"/* "${pkgdir}/usr/lib/lazylibrarian"

  install -Dm644 "${srcdir}/lazylibrarian.service" "${pkgdir}/usr/lib/systemd/system/lazylibrarian.service"
  install -Dm644 "${srcdir}/lazylibrarian.sysusers" "${pkgdir}/usr/lib/sysusers.d/lazylibrarian.conf"
}
