# Maintainer: James An <james@jamesan.ca>

_pkgname=behat
pkgname="php-$_pkgname"
pkgver=3.0.15
pkgrel=1
pkgdesc='An open source behavior-driven development framework for PHP 5.3 and 5.4'
arch=('any')
url="http://$_pkgname.org"
license=('MIT')
depends=('php')
source=(
    "https://github.com/downloads/${_pkgname^}/${_pkgname^}/$_pkgname.phar"
    "https://raw.githubusercontent.com/${_pkgname^}/${_pkgname^}/master/LICENSE"
)
md5sums=('f0c9117837449fbfcfd32840a7bb66d4'
         'bb73430c2c40651766d639dd4bf7f9e7')

package() {
    install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m755 "$_pkgname.phar" "${pkgdir}/usr/share/webapps/bin/$_pkgname.phar"
    install -d "${pkgdir}/usr/bin"
    ln -s "/usr/share/webapps/bin/$_pkgname.phar" "${pkgdir}/usr/bin/$_pkgname"
}
