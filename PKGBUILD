# Maintainer:    mzwing <mzwing@mzwing.eu.org>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=spark-store-console-bin
_pkgver=4.8.1-console2
pkgver=${_pkgver//-/_}
pkgrel=1
pkgdesc='Spark Store, A community powered app store, based on DTK. (Console version)'
arch=('x86_64')
url='https://www.spark-app.store/'
license=('GPL-3.0')
depends=('wget' 'aria2' 'zenity' 'polkit' 'libnotify' 'python' 'desktop-file-utils' 'curl' 'sudo' 'lsb-release' 'gnupg')
provides=('spark-store-console')
source_x86_64=("spark-store-console_4.8.1-console2_all.deb::https://gitee.com/spark-store-project/spark-store/releases/download/5.0.1/spark-store-console_4.8.1-console2_all.deb")
sha256sums_x86_64=('91040e57d3369f416ebd169b0388f08d6bb50a514369d52d8748dc53fd312490')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cp -dpr --no-preserve=ownership "$srcdir/opt/" "$pkgdir/opt"
    cp -dpr --no-preserve=ownership "$srcdir/usr/" "$pkgdir/usr"
}
