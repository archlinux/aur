# Maintainer: Nicolai Schmid <nicolai@schmid.uno>
# PKGBUILD-Credit: https://aur.archlinux.org/account/teprrr

pkgname=portfolio-performance-bin
pkgver=0.41.1
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

md5sums=('3d2f53e4afdc9dd8b4ac250b63129d81'
         'a1204cabfcbf5a026cd44923b87be026')
