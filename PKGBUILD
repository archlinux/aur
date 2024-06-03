# Maintainer: linzeen
# Contributor: linzeen
pkgname=wechat-without-sandbox
makedepends=('dpkg' 'tar')
pkgver=1.0.0.238
pkgrel=1
pkgdesc="wechat(no sandbox isolated) without login restrict. If you mind no sand-box, you could download another version like  https://wiki.archlinux.org/title/WeChat"
source=("https://archive2.kylinos.cn/deb/kylin/production/PART-V10-SP1/custom/partner/V10-SP1/pool/all/wechat-beta_1.0.0.238_amd64.deb" "file.tar.gz")
sha256sums=('8df10abced0ef5e3e5c2bae5006febe32a9cd8b385b84b7b9f7e044ece3e8952' 'c3f9a2b95795b5c7036c8a9ad0f12a4850d6f41fe4329d15f7d1cfd9cba420c8')
arch=('x86_64')
url="weixin.qq.com"
license=('PGP')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'dbus' 'expat' 'fontconfig' 'glib2' 'libdrm' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxrandr' 'libxrender' 'mesa' 'nspr' 'nss' 'pango' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' 'zlib' 'lsb-release')
provides=('wechat')
options=('!strip' '!emptydirs')
install=${pkgname}.install
package(){
dpkg -X wechat-beta_1.0.0.238_amd64.deb "${pkgdir}/"
rm -rf "${pkgdir}/usr/"
tar -xvf file.tar.gz
cp -r "file/etc/" "${pkgdir}/"
cp -r "file/usr/" "${pkgdir}/"
}
