# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.46.0
pkgrel=1
pkgdesc="A simple tool to calculate the overall performance of an investment portfolio."
arch=('x86_64')
url="https://www.portfolio-performance.info"
options=('!strip')
depends=()

source=(
    portfolio_$pkgver.tar.gz::"https://github.com/buchen/portfolio/releases/download/${pkgver}/PortfolioPerformance-${pkgver}-linux.gtk.x86_64.tar.gz"
    portfolio-performance.desktop
)

package() {
    install -d "$pkgdir"/{opt,usr/bin}

    cp -a "$srcdir"/portfolio "${pkgdir}"/opt/PortfolioPerformance

    #tar xzf portfolio_${pkgver}.tar.gz -C "${pkgdir}"/opt/PortfolioPerformance
    ln -s /opt/PortfolioPerformance/PortfolioPerformance "$pkgdir"/usr/bin/PortfolioPerformance

    mkdir -p ${pkgdir}/usr/share/applications
    install -m644 "${srcdir}/portfolio-performance.desktop" "${pkgdir}/usr/share/applications/portfolio-performance.desktop"

    install -Dm 644 "$srcdir"/portfolio/icon.xpm -t "$pkgdir"/usr/share/pixmaps/PortfolioPerformance.xpm
}

md5sums=('e84e63bc3401d4b5c00e999a8993a77d'
         'd06f3f804dce0a605db450f863da9326')
