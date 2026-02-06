# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=1.0.4
pkgrel=1
pkgdesc="Get apps and run in Amber-PM container"
arch=('x86_64' 'aarch64')
# url="https://gitee.com/amber-ce/amber-pm-store/"
# url="https://gitee.com/spark-store-project/apm-store"
url="https://github.com/elysia-best/apm-app-store"
license=('custom')
depends=('amber-package-manager' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux' 'libsecret' 'shared-mime-info')


# source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
# source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://gitee.com/spark-store-project/apm-store/repository/archive/0.0.3.zip")
# source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm-store/repository/archive/${pkgver}.tar.gz")
source_x86_64=("$pkgname-$pkgver.deb::https://github.com/elysia-best/apm-app-store/releases/download/v${pkgver}/apm-store_${pkgver}_linux_amd64.deb")
source_aarch64=("$pkgname-$pkgver.deb::https://github.com/elysia-best/apm-app-store/releases/download/v${pkgver}/apm-store_${pkgver}_linux_arm64.deb")
sha256sums_x86_64=('30d9877d5198020d1d1739bfe090af41bfa3e4af983704df063f4f7ae758f744')
sha256sums_aarch64=('30d9877d5198020d1d1739bfe090af41bfa3e4af983704df063f4f7ae758f744')
install=amber-pm-store.install

package() {
#     cd "$srcdir/amber-pm-store-${pkgver}/src"
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    install -Dm644 \
        "$pkgdir/opt/apm-store/extras/store.spark-app.amber-pm-store.policy" \
        "$pkgdir/usr/share/polkit-1/actions/store.spark-app.amber-pm-store.policy"
}
