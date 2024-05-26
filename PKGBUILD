# Maintainer: linzeen
# Contributor: linzeen
pkgname=wechat-arch-linux
makedepends=('dpkg' 'git')
pkgver=1.0.0.238
pkgrel=1
pkgdesc="Wechat for Arch Linux"
source=("https://archive2.kylinos.cn/deb/kylin/production/PART-V10-SP1/custom/partner/V10-SP1/pool/all/wechat-beta_1.0.0.238_amd64.deb")
sha256sums=('8df10abced0ef5e3e5c2bae5006febe32a9cd8b385b84b7b9f7e044ece3e8952')
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
mv "${pkgdir}/opt/wechat-beta" "${pkgdir}/opt/wechat"
git clone https://github.com/linzeennnn/wechat-arch-linux.git
cp -r wechat-arch-linux/etc "${pkgdir}/"
cp -r wechat-arch-linux/usr "${pkgdir}/"
}
