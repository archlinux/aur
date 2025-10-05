# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# Maintainer: Florian Wehner <florian@whnr.de>
# Maintainer: tuxxx <nzb_tuxxx@proton.me>
# Contributor: Alexander Phinikarides <alexisph@gmail.com>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.80.3
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
sha256sums=('a9f87452a12f7e451502e3a3e7aef3f4365f314428a263e160e8bf80d151a581'
            'SKIP'
            '61397bafed5a2954975294fdd04e69e0a2831fae22af88d32e854cd5837b93bf'
            'e3829c92603b3edd8039959af91cf957d0287bb59c395e30c28f661d5fd0403d')

package() {
    install -d "$pkgdir"/{opt,usr/bin,usr/share/pixmaps,usr/share/applications}

    cp -a "$srcdir"/portfolio "$pkgdir"/opt/portfolio-performance-bin

    ln -s /opt/portfolio-performance-bin/PortfolioPerformance "$pkgdir"/usr/bin/PortfolioPerformance

    install -Dm 644 portfolio-performance-bin.desktop -t "$pkgdir"/usr/share/applications
    install -Dm 644 portfolio-performance-bin.svg -t "$pkgdir"/usr/share/pixmaps
}
