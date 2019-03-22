# Maintainer: Ye Shu <shuye02@outlook.com>

pkgname=fuck-xuexiqiangguo
pkgver=0.4.3
pkgrel=1
arch=('x86_64')

pkgdesc="一款帮助成年人（或许未来包括小朋友）自动学刁的软件"
url="https://github.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo"
license=('MIT')
depends=('gtk3' 'nss' 'libxss'  'alsa-lib')
optdepends=('xorg-server-xvfb: Start application headlessly')

source=(
    "${pkgname}-${pkgver}.zip::https://github.com/fuck-xuexiqiangguo/Fuck-XueXiQiangGuo/raw/c293821f79773b17d3edc7b61e1d00678be4b4e5/Fuck%E5%AD%A6%E4%B9%A0%E5%BC%BA%E5%9B%BD-linux.zip"
    "https://github.com/fuck-xuexiqiangguo/source-code/raw/master/logo.png"
    "Fuck-XueXiQiangGuo.desktop")
sha512sums=(
    'd3f0e0f36272716f42af0960896647d69c8f70d6102234cce0f1e8dcb09718c2f23b768374399b6e1d133102a4c6101062a72aac9ea7415fbeba0fd7800f70b2'
    '99bd0ae898268d93cbc2aedecc78489c8400b2cb0255d368e532f6fbb83f7f2693ec5f93191bf51d4698040d3627a4fdd29e768be0c36f26e19465c61e959ec8'
    'ba364ee061bb550bca7a83332a72a046afe1bfd41253ef6871cdd70e6df3931d19dd280a3e75ea1cfeaeba28df62724822a298b32f5373909836777fae8c2fb2')

package(){
    mkdir -p ${pkgdir}/opt/Fuck-XueXiQiangGuo
    cp -rP ${srcdir}/* ${pkgdir}/opt/Fuck-XueXiQiangGuo
    find ${pkgdir}/opt/Fuck-XueXiQiangGuo -type l -exec rm -f {} \;

    mkdir -p ${pkgdir}/usr/bin
    ln -sf "/opt/Fuck-XueXiQiangGuo/Fuck学习强国" "$pkgdir/usr/bin/Fuck学习强国"

    install -Dm644 ${srcdir}/Fuck-XueXiQiangGuo.desktop "${pkgdir}/usr/share/applications/Fuck-XueXiQiangGuo.desktop"
    install -Dm644 ${srcdir}/logo.png "${pkgdir}/usr/share/pixmaps/Fuck-XueXiQiangGuo.png"
}
