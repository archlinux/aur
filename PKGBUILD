# Maintainer: Syreese <syreeseofficial@gmail.com>
pkgname=dailydash
pkgver=1.0.2
pkgrel=1
pkgdesc="Terminal-based Head-Up Display for focus-driven developers"
arch=('any')
url="https://github.com/SyreeseOfficial/DailyDash"
license=('MIT')
depends=('python' 'python-rich' 'python-psutil' 'python-requests' 'python-pygame' 'python-plyer')
optdepends=('libnotify: Desktop notifications on Linux')
source=("https://github.com/SyreeseOfficial/DailyDash/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f7626edf25f38045d727b26023b8c24631d4efc3b2119f3fe06f38f0310a61a2')

package() {
    cd "DailyDash-${pkgver}"

    # Install Files
    install -d "${pkgdir}/usr/lib/${pkgname}"
    cp -r * "${pkgdir}/usr/lib/${pkgname}/"

    # Create Launcher
    install -d "${pkgdir}/usr/bin"
    echo "#!/bin/bash" > "${pkgdir}/usr/bin/${pkgname}"
    echo "cd /usr/lib/${pkgname} && python main.py \"\$@\"" >> "${pkgdir}/usr/bin/${pkgname}"
    chmod +x "${pkgdir}/usr/bin/${pkgname}"
    
    # License
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
