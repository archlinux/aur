pkgname=chevereto
pkgver=1.6.2
pkgrel=1
pkgdesc="Chevereto is an image hosting script that allows you to create a beautiful and full-featured image hosting website on your own server."
arch=(any)
url="https://chevereto.com/free"
license=("AGPL")
optdepends=('php-apache: to use the Apache web server'
'nginx: web server'
)
depends=("php" "php-gd" "mariadb")
install=chevereto.install
options=(emptydirs)

source=(https://github.com/Chevereto/Chevereto-Free/archive/${pkgver}.tar.gz
       chevereto.perm.sh)
sha256sums=('4636e24511a0ae7abd27aadd57bc6b08735f9fb8ad6fba11c9142c9e9317f8dc'
            '0d8db5e6a5aa237c6efd8878782f49b44788ef464584cea8113528f6cff793cd')


package() {

    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -a chevereto-free-$pkgver "${pkgdir}/usr/share/webapps/chevereto"
    
    install -D -m755 "${srcdir}/chevereto.perm.sh" "${pkgdir}/usr/bin/set-chevereto-perm"
}
