# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
# Maintainer: Light Ning <lightning1141 at gmail dot com>
pkgname=huaweicloud-obs-obsutil-bin
pkgver=5.4.11
pkgrel=1
pkgdesc="A command line tool for accessing and managing OBS on HUAWEI CLOUD"
arch=('x86_64' 'aarch64')
url="https://support.huaweicloud.com/intl/en-us/utiltg-obs/obs_11_0001.html"
license=('Apache')
conflicts=("huaweicloud-obs-obsutil-git")

source_x86_64=("obsutil_linux_amd64-${pkgver}.tar.gz::https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz")
sha256sums_x86_64=('d055d25a6ef963131c25fe9f3419ffa97a69d92cddff1c7c1a8a7aa3933fff72')

source_aarch64=("obsutil_linux_arm64-${pkgver}.tar.gz::https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_arm64.tar.gz")
sha256sums_aarch64=('c8e9abc587a0f8fb12aba59f321c76dd65090a9bdb6b40305391e7fe8c3c96c7')

prepare() {
    chmod 755 -R "$srcdir"
}

package() {
    if test $CARCH = 'x86_64'; then
        cd "$srcdir/obsutil_linux_amd64_${pkgver}"
    elif test $CARCH = 'aarch64'; then
        cd "$srcdir/obsutil_linux_arm64_${pkgver}"
    fi
    install -Dm755 ./obsutil -t "$pkgdir"/usr/bin/
}
