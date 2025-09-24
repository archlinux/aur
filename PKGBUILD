# Maintainer: W1ngD1nGa5ter <wangyiben1@outlook.com>
pkgname=ccr-plus-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A simple judging environment for Olympiad in Informatics"
arch=('x86_64')
url="https://github.com/sxyzccr/CCR-Plus"
license=('GPL3')
depends=('qt5-base')
provides=('ccr-plus')
source=("$url/releases/download/v$pkgver/CCR-Plus_v${pkgver}_linux_x64.zip")
md5sums=('3a2d9e320d04ee15d2dd2f61b4ea8eff')

package() {
    cd "$srcdir/CCR-Plus"
    install -d "$pkgdir/opt/ccr-plus"
    cp -r . "$pkgdir/opt/ccr-plus"
    chmod +x "$pkgdir/opt/ccr-plus/CCR-Plus"
    install -d "$pkgdir/usr/bin"
    ln -sf "$pkgdir/opt/ccr-plus/CCR-Plus" "$pkgdir/usr/bin/ccr-plus"
    install -d "$pkgdir/usr/share/applications"
    cat > "$pkgdir/usr/share/applications/ccr-plus.desktop" << EOF
[Desktop Entry]
Version=$pkgver
Type=Application
Terminal=false
Name=CCR Plus
Comment[zh_CN]=CCR Plus 测评器
GenericName[zh_CN]=CCR Plus 测评器
Path=/opt/ccr-plus
Exec=/opt/ccr-plus/CCR-Plus
Icon=/opt/ccr-plus/icon/CCR.ico
Categories=Qt;Development
EOF
}
