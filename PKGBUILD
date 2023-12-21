# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# Maintainer: Alexander Phinikarides <alexisph@gmail.com>
# Maintainer: Florian Wehner <florian@whnr.de>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.66.2
pkgrel=1
pkgdesc="A simple tool to calculate the overall performance of an investment portfolio."
arch=('x86_64')
url="https://www.portfolio-performance.info"
license=('EPL')
options=('!strip')
depends=('java-runtime')

source=(
    portfolio_$pkgver.tar.gz::"https://github.com/buchen/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.x86_64.tar.gz"
    portfolio-performance-bin.svg::"https://raw.githubusercontent.com/buchen/portfolio/${pkgver}/portfolio-product/icons/logo.svg"
    portfolio-performance-bin.desktop
)

package() {
    install -d "$pkgdir"/{opt,usr/bin}

    cp -a "$srcdir"/portfolio "${pkgdir}"/opt/portfolio-performance-bin

    ln -s /opt/portfolio-performance-bin/PortfolioPerformance "$pkgdir"/usr/bin/PortfolioPerformance

    install -Dm 644 portfolio-performance-bin.desktop -t "$pkgdir"/usr/share/applications
    install -Dm 644 portfolio-performance-bin.svg -t "$pkgdir"/usr/share/pixmaps
}


sha512sums=('1845dd832a89de10f80c413b82527d0a0c7a951d16150b790df69b06e30330040b91de9275db9c0992161ea5d00a26f081f9bed3946a656003103c62001d6a35'
            'a7aef110c3379ea40644c3acc8681abd2bda82522d90fc4777632883454055c63426f97dada8ca247e5fa20a9f5b462eead46d2c2bf16989d35cebd774d32162'
            '30301e96d108f25b10d77bf370bef366cb774f400487f6ffb1d3d718691bd2ee29b6a0fe5e7d8e8cfbe8af538285e9b2953a67657c4c752025045a7a6d9efb82')
