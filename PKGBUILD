# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# Maintainer: Alexander Phinikarides <alexisph@gmail.com>
# Maintainer: Florian Wehner <florian@whnr.de>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.61.3
pkgrel=1
pkgdesc="A simple tool to calculate the overall performance of an investment portfolio."
arch=('x86_64')
url="https://www.portfolio-performance.info"
license=('EPL')
options=('!strip')
depends=('jre-openjdk' 'webkit2gtk')

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


sha512sums=('efad9e87d122ce43e357687f948d8d97c870a85341acb3d9803d9763df9910fd27288b506700564b57e594fe1b30a8b34655d3318eb3516814de0f66a497c383'
            'a7aef110c3379ea40644c3acc8681abd2bda82522d90fc4777632883454055c63426f97dada8ca247e5fa20a9f5b462eead46d2c2bf16989d35cebd774d32162'
            '848a4d16dca0ad21d848986021a8d86fee7b3f4f81e916359cbd837d962b4ac5c2dd2b765d52dc40200761eaeac758a99be10c503f174f88e6662a6fc46a20ff')
