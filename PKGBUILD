# Maintainer: James An <james@jamesan.ca>

pkgname=aegir-hostmaster
_pkgname=hostmaster
pkgver=2.1
pkgrel=1
pkgdesc="mass Drupal hosting system - backend"
arch=('any')
url='http://aegirproject.org'
license=('GPL')
depends=('drush')
optdepends=(
    #'rsync: asdf'
    #'mariadb: '
    #'php-apache'
    #'nginx: '
    #'php-fpm: '
    #'sudo'
    #'smtp-forwarder'
    #'unzip'
)
source=("http://ftp.drupal.org/files/projects/${_pkgname}-6.x-${pkgver}.tar.gz")
md5sums=('2a9fd98331ba8852e154e060c2ee9252')

package() {
    cd $_pkgname

    rm LICENSE.txt
    rm reset.txt
    install -m644 -D README.txt "${pkgdir}/usr/share/doc/${pkgname}/README.txt"

    msg2 'Adding main files'
    install -m755 -d "${pkgdir}/usr/share/drush/commands/${_pkgname}"
    mv * "${pkgdir}/usr/share/drush/commands/${_pkgname}"
}
