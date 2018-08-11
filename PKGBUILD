# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: Somasis <somasis@cryptolab.net>

pkgname=mugshot
pkgver=0.4.1
pkgrel=1
pkgdesc="Program to update personal user details"
arch=('any')
url="https://launchpad.net/mugshot"
license=('GPLv3')
depends=('gtk3' 'python-pexpect' 'python-dbus' 'python-cairo' 'python-gobject' 'accountsservice')
makedepends=('python-distutils-extra' 'intltool')
optdepends=('cheese: webcam support'
            'pidgin: update buddy icon'
            'libreoffice: update user details')
options=(!emptydirs)
source=("https://launchpad.net/mugshot/${pkgver%.*}/$pkgver/+download/mugshot-${pkgver}.tar.gz")
sha256sums=('d2b52b0b1737bd65d6f6478c4f907b0f641899b5f3b130a155e95d170742f286')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root "${pkgdir}" --optimize=1
}
