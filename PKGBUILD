# Maintainer: wildkid1024 <wildkid1024 at outlook dot com>
pkgname=lingma-bin
pkgver=0.8.0
pkgrel=2
pkgdesc="Lingma IDE 灵码编辑器 - Binary Version"
arch=('x86_64')
url="https://lingma.aliyun.com/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa')
provides=('lingma' 'lingma-ide')
conflicts=('lingma' 'lingma-ide')
options=(!strip)

# 已替换为你提供的最新下载链接
source=("lingma_amd64.deb::https://lingma-ide.oss-rg-china-mainland.aliyuncs.com/release/latest/lingma_amd64.deb")

# 清空校验和（使用 latest 链接会自动更新文件，需要重新生成校验和）
sha256sums=('d6c5214effc2e7fbec34d80034292d21d8fc0ea370915f54da55e933a31acf1c')

package() {
    bsdtar -xOf "lingma_amd64.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
