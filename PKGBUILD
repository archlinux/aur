# 【原生发布】【AUR二进制包】只使用对应原生标签中已经验证的两种架构资产
pkgname=mark-shot-bin
pkgver=0.2.6
pkgrel=1
pkgdesc='Native screenshot, annotation and recording tool (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jswysnemc/mark-shot'
license=('MIT' 'Apache-2.0')
depends=('glibc' 'fontconfig' 'libxkbcommon' 'libxkbcommon-x11' 'libxcb' 'openssl' 'pipewire' 'libpulse' 'libva' 'libdrm' 'mesa')
optdepends=('noto-fonts: fallback fonts' 'noto-fonts-cjk: CJK fonts' 'xdg-desktop-portal: portal capture' 'mark-shot: source build if Arch ARM library versions differ')
provides=("mark-shot=$pkgver")
conflicts=('mark-shot')
options=('!strip')
# 【原生发布】【下载文件】使用独立文件名，避免 makepkg 将下载资产误认为已构建的输出包
source_x86_64=("mark-shot-prebuilt-0.2.6-x86_64.pkg.tar.zst::https://github.com/jswysnemc/mark-shot/releases/download/v0.2.6/mark-shot-bin-0.2.6-1-x86_64.pkg.tar.zst")
source_aarch64=("mark-shot-prebuilt-0.2.6-aarch64.pkg.tar.zst::https://github.com/jswysnemc/mark-shot/releases/download/v0.2.6/mark-shot-bin-0.2.6-1-aarch64.pkg.tar.zst")
sha256sums_x86_64=('4becc0a6e8fcbd200011e8e813a7d4c5cf6c761f9eece7829a32994cf362db30')
sha256sums_aarch64=('41cfcfcec74aa7eb54bd8517bc8c11c77be2ddcd0f0a62632d815b679eb42cb1')

# 【原生发布】【安装方法】无传参，将经摘要校验的 usr 安装树复制到 pkgdir，无返回值
package() {
  cp -a "$srcdir/usr" "$pkgdir/"
}
