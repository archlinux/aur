# Maintainer: wildkid1024 <wildkid1024 at outlook dot com>
pkgname=lingma-bin
pkgver=0.4.0
pkgrel=1
pkgdesc="Lingma IDE 灵码编辑器 - Binary Version"
arch=('x86_64')
url="https://lingma.aliyun.com/"
license=('custom')
depends=('gtk3' 'nss' 'alsa-lib' 'libxss' 'libxtst' 'mesa')
provides=('lingma' 'lingma-ide')
conflicts=('lingma' 'lingma-ide')
options=(!strip)

source=("lingma_${pkgver}_amd64.deb::https://lingma-ide.oss-rg-china-mainland.aliyuncs.com/prerelease/${pkgver}/b41a18709dd29e6b396c3284ef2e521e8b981f68/lingma_${pkgver}_amd64.deb")

sha256sums=('3e09faf4f25d25ffea2e6388969b95fc5d06f3f065338143749d90657d703148')

package() {
    bsdtar -xOf "lingma_${pkgver}_amd64.deb" data.tar.xz | bsdtar -xJf - -C "${pkgdir}"
}
