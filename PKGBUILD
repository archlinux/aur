# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# Maintainer: Florian Wehner <florian@whnr.de>
# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Alexander Phinikarides <alexisph@gmail.com>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.77.1
pkgrel=1
pkgdesc="A simple tool to calculate the overall performance of an investment portfolio."
arch=('x86_64')
url="https://www.portfolio-performance.info"
license=('EPL-1.0')
depends=('java-runtime' 'gtk3')
conflicts=('portfolio')
options=('!strip')
source=(
    portfolio_$pkgver.tar.gz::"https://github.com/portfolio-performance/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.${CARCH}.tar.gz"
    portfolio_$pkgver.tar.gz.asc::"https://github.com/portfolio-performance/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.${CARCH}.tar.gz.asc"
    portfolio-performance-bin.svg::"https://raw.githubusercontent.com/portfolio-performance/portfolio/${pkgver}/portfolio-product/icons/logo.svg"
    portfolio-performance-bin.desktop)
validpgpkeys=('E46E6F8FF02E4C83569084589239277F560C95AC')
sha512sums=('f881d35f4979f29f43e76aa03ccc465b1b8f55ea1c5a8ee80fab7785eed17619eadb34ea6dbe1e0038300cdbbc19856e2d63af534ab083f026bf44dbb62a0d1c'
            'SKIP'
            'a7aef110c3379ea40644c3acc8681abd2bda82522d90fc4777632883454055c63426f97dada8ca247e5fa20a9f5b462eead46d2c2bf16989d35cebd774d32162'
            '29986cbce9bdb3ad385de9d0ca11c41cd640e3fd258b54768e7158cdcc9db303b760b535de3d48d31c888e37966b885c7a645b4a2b0bcc95751b584df4ad834d')

package() {
    install -d "$pkgdir"/{opt,usr/bin,usr/share/pixmaps,usr/share/applications}

    cp -a "$srcdir"/portfolio "$pkgdir"/opt/portfolio-performance-bin

    ln -s /opt/portfolio-performance-bin/PortfolioPerformance "$pkgdir"/usr/bin/PortfolioPerformance

    install -Dm 644 portfolio-performance-bin.desktop -t "$pkgdir"/usr/share/applications
    install -Dm 644 portfolio-performance-bin.svg -t "$pkgdir"/usr/share/pixmaps
}
