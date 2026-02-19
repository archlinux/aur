# Maintainer: Anysets <anysets@qq.com>
pkgname=amber-pm-store
pkgver=1.1.1
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
sha256sums_x86_64=('02c3284ab13cd61cf55b3dfce11b2a43be8e08d9ccc2959c4a58f835be45228e')
sha256sums_aarch64=('e83951d246d6005b391c7d0eda5a9e471f8a728f922756202b44439a9d8928a9')
install=amber-pm-store.install

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}/"

    install -Dm644 \
        "$pkgdir/opt/apm-store/extras/store.spark-app.amber-pm-store.policy" \
        "$pkgdir/usr/share/polkit-1/actions/store.spark-app.amber-pm-store.policy"
}
