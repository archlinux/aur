# Maintainer: MCB-SMART-BOY <your-email@example.com>
pkgname=gridix-bin
pkgver=0.5.1
pkgrel=1
pkgdesc="简洁、快速、安全的跨平台数据库管理工具，Helix/Vim 风格键位"
arch=('x86_64')
url="https://github.com/MCB-SMART-BOY/Gridix"
license=('MIT')
depends=('gtk3' 'xdotool')
provides=('gridix')
conflicts=('gridix')
source=("https://github.com/MCB-SMART-BOY/Gridix/releases/download/v${pkgver}/gridix-linux-x86_64.tar.gz"
        "gridix.desktop"
        "LICENSE::https://raw.githubusercontent.com/MCB-SMART-BOY/Gridix/v${pkgver}/LICENSE")
sha256sums=('35b516e172d2093988108057520fe5eb5b896f68454460af1c3b2d4f06c9192e'
            'SKIP'
            'SKIP')

package() {
    cd "$srcdir"
    
    # 安装二进制
    install -Dm755 gridix "$pkgdir/usr/bin/gridix"
    
    # 安装桌面文件
    install -Dm644 gridix.desktop "$pkgdir/usr/share/applications/gridix.desktop"
    
    # 安装许可证
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
