# Maintainer: wildkid1024 <wildkid1024 at outlook dot com>
pkgname=lingma-bin
pkgver=0.11.0
pkgrel=4
pkgdesc="Lingma IDE 灵码编辑器 - Binary Version"
arch=('x86_64')
url="https://lingma.aliyun.com/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa')
provides=('lingma' 'lingma-ide')
conflicts=('lingma' 'lingma-ide')
options=(!strip)

# 已替换为你提供的最新下载链接
source=("lingma_${pkgver}_amd64.deb::https://lingma-ide.oss-rg-china-mainland.aliyuncs.com/release/latest/lingma_amd64.deb")

# 清空校验和（使用 latest 链接会自动更新文件，需要重新生成校验和）
sha256sums=('SKIP')

package() {
    bsdtar -xOf "lingma_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
