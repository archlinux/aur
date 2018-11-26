pkgname=chevereto
pkgver=1.1.0
pkgrel=1
pkgdesc="Chevereto is an image hosting script that allows you to create a beautiful and full-featured image hosting website on your own server."
arch=(any)
url="https://chevereto.com/free"
license=("GPL")
depends=("php" "php-gd" "mariadb")
install=chevereto.install
options=(emptydirs)

source=(https://github.com/Chevereto/Chevereto-Free/archive/${pkgver}.tar.gz
       chevereto.perm.sh)
md5sums=('694fa397ea504e8eb018c5b8392a7c84'
         'e7add39512c475948c6709a0a6a9c309')



package() {

    mkdir -p "${pkgdir}/usr/share/webapps"
    cp -a Chevereto-Free-$pkgver "${pkgdir}/usr/share/webapps/chevereto"
    
    install -D -m755 "${srcdir}/chevereto.perm.sh" "${pkgdir}/usr/bin/set-chevereto-perm"
}
