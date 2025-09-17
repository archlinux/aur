# Maintainer:    mzwing <mzwing@mzwing.eu.org>
# Co-Maintainer: Misaka13514 <Misaka13514 at gmail dot com>

pkgname=spark-store-console-bin
pkgver=4.8.1
pkgrel=1
pkgdesc='Spark Store, A community powered app store, based on DTK. (Console version)'
arch=('x86_64')
url='https://www.spark-app.store/'
license=('GPL-3.0')
depends=('wget' 'aria2' 'zenity' 'polkit' 'libnotify' 'python' 'desktop-file-utils' 'curl' 'sudo' 'lsb-release' 'gnupg')
provides=('spark-store-console')
source_x86_64=("spark-store-console_$pkgver-console_all.deb::https://gitee.com/spark-store-project/spark-store/releases/download/$pkgver/spark-store-console_$pkgver-console_all.deb")
sha256sums_x86_64=('d034d46ef246d69c4fa950a54a4e8a91857816edf267bd2817b0ff52911d2360')

prepare() {
    tar -Jxf data.tar.xz -C "${srcdir}"
}

package() {
    cp -dpr --no-preserve=ownership "$srcdir/opt/" "$pkgdir/opt"
    cp -dpr --no-preserve=ownership "$srcdir/usr/" "$pkgdir/usr"
}
