# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.56.6
pkgrel=1
pkgdesc="A simple tool to calculate the overall performance of an investment portfolio."
arch=('x86_64')
url="https://www.portfolio-performance.info"
options=('!strip')
depends=('jre11-openjdk' 'webkit2gtk')

source=(
    portfolio_$pkgver.tar.gz::"https://github.com/buchen/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.x86_64.tar.gz"
    portfolio-performance-bin.svg::https://www.portfolio-performance.info/images/logo.svg
    portfolio-performance-bin.desktop
)

package() {
    install -d "$pkgdir"/{opt,usr/bin}

    cp -a "$srcdir"/portfolio "${pkgdir}"/opt/portfolio-performance-bin

    ln -s /opt/portfolio-performance-bin/PortfolioPerformance "$pkgdir"/usr/bin/PortfolioPerformance

    install -Dm 644 portfolio-performance-bin.desktop -t "$pkgdir"/usr/share/applications
    install -Dm 644 portfolio-performance-bin.svg -t "$pkgdir"/usr/share/pixmaps
}


sha512sums=('eb2d0be0763a66662beff7daa980bee3acaf4359c13f19a267258eff910338b8735e2c8c5df1657f92366e77e77468db42031a582eb5e0d975d72beb2bdc8a2a'
            '177215db98deb3999d04ed097e880fe3cd0dc529051e3bf6aaf5f00f06aed08d1bbca77f298623a50376a71a256d0c41d3c86b17b70241dbe9c06f96a8eb4e63'
            '848a4d16dca0ad21d848986021a8d86fee7b3f4f81e916359cbd837d962b4ac5c2dd2b765d52dc40200761eaeac758a99be10c503f174f88e6662a6fc46a20ff')
