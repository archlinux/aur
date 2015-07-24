# Maintainer: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.2.5
pkgver_min=${pkgver%.*}
pkgrel=5
pkgdesc="Program to update personal user details"
arch=('any')
install="${pkgname}.install"
url="https://launchpad.net/mugshot"
license=('GPLv3')
depends=('python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' 'python-distutils-extra')
optdepends=( 'gstreamer0.10-good-plugins: webcam support'
             'pidgin: update buddy icon'
             'libreoffice: update user details'
             'accountsservice: user image management without ~/.face'
)
options=(!emptydirs)

source=("https://launchpad.net/mugshot/$pkgver_min/$pkgver/+download/mugshot-${pkgver}.tar.gz")
md5sums=('11a5e5aac8ed876bc50ebd937fb450ab')

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root "${pkgdir}"
}
