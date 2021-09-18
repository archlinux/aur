# Maintainer: Astro Benzene <universebenzene at sina dot com>
# Maintainer: xgdgsc <xgdgsc at gmail dot com>

pkgname=electronic-wechat-zzy-ac
pkgver=2.3.1.1
pkgrel=1
pkgdesc="A better WeChat on macOS and Linux. Built with Electron. Maintained by kooritea"
url=https://github.com/zzy-ac/electronic-wechat
arch=(x86_64)
replaces=('electronic-wechat' 'electronic-wechat-git')
conflicts=('electronic-wechat' 'electronic-wechat-git')
depends=('nss' 'gtk3' 'libxss' 'electron4-bin')
license=('MIT')
md5sums=('965fdff3701fa8c8be9be1353659e349')

source=("https://github.com/zzy-ac/electronic-wechat/releases/download/v${pkgver}/electronic-wechat-linux-x64.tar.gz")


package() {
    mkdir -p "${pkgdir}/opt/electronic-wechat-linux-x64"

    install -dm755 "${pkgdir}"/usr/share/applications
    cp electronic-wechat-linux-x64/electronic-wechat.desktop "${pkgdir}"/usr/share/applications

    cd electronic-wechat-linux-x64
    install -dm755 "${pkgdir}/opt/electronic-wechat-linux-x64"
    mv * "${pkgdir}/opt/electronic-wechat-linux-x64"

    install -dm755 "${pkgdir}"/usr/bin
    ln -s /opt/electronic-wechat-linux-x64/electronic-wechat "${pkgdir}/usr/bin/electronic-wechat"
}
