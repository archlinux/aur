# Maintainer: Misaka13514 <Misaka13514 at gmail dot com>
pkgname=huaweicloud-obs-obsutil-bin
pkgver=5.3.4
pkgrel=1
pkgdesc="A command line tool for accessing and managing OBS on HUAWEI CLOUD"
arch=('x86_64' 'aarch64')
url="https://support.huaweicloud.com/intl/en-us/utiltg-obs/obs_11_0001.html"
license=('Apache')
conflicts=("huaweicloud-obs-obsutil-git")

source_x86_64=('https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_amd64.tar.gz')
sha256sums_x86_64=('7c9b50af08464390d80a96159291a4db0df80d037f927e6abcf1acb8ef3be503')

source_aarch64=('https://obs-community-intl.obs.ap-southeast-1.myhuaweicloud.com/obsutil/current/obsutil_linux_arm64.tar.gz')
sha256sums_aarch64=('31586d7d608e68b0954a19160228609ba17e07c7b70fa26b4ee74a78031b0389')

package() {
    if test $CARCH = 'x86_64'; then
        cd "$srcdir/obsutil_linux_amd64_${pkgver}"
    elif test $CARCH = 'aarch64'; then
        cd "$srcdir/obsutil_linux_arm64_${pkgver}"
    fi
    install -Dm755 ./obsutil -t "$pkgdir"/usr/bin/
}
