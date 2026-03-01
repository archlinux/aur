# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=1.2.0
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
source_x86_64=("https://github.com/elysia-best/apm-app-store/releases/download/v${pkgver}/apm-store_${pkgver}_linux_amd64.deb")
source_aarch64=("https://github.com/elysia-best/apm-app-store/releases/download/v${pkgver}/apm-store_${pkgver}_linux_arm64.deb")
sha256sums_x86_64=('b660cc780bda6f37151884dfff0744ecc340c6c7a1e1fbfd078e1a06dd27513c')
sha256sums_aarch64=('299f3d75159c22cf65421978f713acd7bb6830f801d4bc7b78c1407f374537ea')
install=amber-pm-store.install

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    install -Dm644 \
        "$pkgdir/opt/apm-store/extras/store.spark-app.amber-pm-store.policy" \
        "$pkgdir/usr/share/polkit-1/actions/store.spark-app.amber-pm-store.policy"
}
