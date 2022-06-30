pkgname=lsky-pro
pkgver=2.0.4
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

sha256sums=('b3166fe8970c3b31e06d7d20d26bb5eb9d1b4cc7d7b98cc14d1ef6ef0b5409db')
