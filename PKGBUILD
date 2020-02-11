# Mantainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>

pkgname=system-config-users
pkgver=1.3.5
pkgrel=1
pkgdesc='A graphical interface for administering users and groups'
arch=('i686' 'x86_64')
url='https://than.fedorapeople.org/system-config-users'
license=('GPL')
depends=('libselinux-python2' 'libuser' 'python2' 'python2-rpm' 'selinux-python2'
         'rpm-tools' 'xdg-utils')
makedepends=()
source=('https://than.fedorapeople.org/system-config-users/system-config-users-1.3.5.tar.bz2'
        'python2.patch')
sha256sums=('bec51eeb845cbbcfbbb42831b2f8b76a6ce56f30bf6ad33bee6aa4d1086a7cf2'
            '7eea5d2699b62839427c885af85633279d7db4ff2ef4867cc3b66220d59f5c0e')


prepare() {
  SRC_PATH="${pkgname}-${pkgver}"
  cp python2.patch $SRC_PATH
  cd $SRC_PATH
  patch -Np0 -i python2.patch
}

build() {
  cd "${pkgname}-${pkgver}"

  make
}

package() {
  cd "${pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
