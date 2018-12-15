# Maintainer: Hilary Jendrasiak <sylogista@sylogista.pl>
pkgname='noaa-apt'
pkgdesc='NOAA APT image decoder with GUI'
pkgver=0.9.6
pkgrel=1 
arch=('x86_64') 
url="https://github.com/martinber/${pkgname}"
license=('GPL3')
depends=('gsl' 'gtk3')
makedepends=('cargo')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=('2b1a21dda40595dfc7ea8666c2f89b8d435dfc2d38efd5c1627b92b05144cbab0545b648696dd1490e724926d2384d725c87324b041882f58d0231c36644ba72')

build()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
    cargo build --release
}

package()
{
    cd "${srcdir}/${pkgname}-${pkgver}/"
    install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
}
