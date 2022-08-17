pkgname=lsky-pro
pkgver=2.1
pkgrel=1
pkgdesc='Your photo album on the cloud.'
license=('GPL3')
depends=('php' 'php-imagick')
optdepends=('nginx: WebUI'
            'apache: WebUI'
            'mysql: database'
            'postgresql: database'
            'sqlite: database')
arch=('any')
url="https://github.com/lsky-org/lsky-pro"
source=(512x512.png
        ${_pkgname}.desktop
        ${_pkgname})
source=("${pkgname}-${pkgver}.zip::${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
noextract=("${pkgname}-${pkgver}.zip")
package() {
    cd $srcdir/
    mkdir -p ${pkgdir}/usr/share/webapps
    unzip ${pkgname}-${pkgver}.zip -d  ${pkgdir}/usr/share/webapps/${pkgname}
    chown -R http:http ${pkgdir}/usr/share/webapps/${pkgname}
}

sha256sums=('335ce172eeb2316db79641cafde8fcbf452f3fc641e5a33c99893c113d7ba722')
