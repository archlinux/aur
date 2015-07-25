# Maintainer: Lukas Fleischer <archlinux at cryptocrack dot de>
# Contributor: Simon Zimmermann <simon@insmo.com>

pkgname='pass'
pkgver=1.6.5
pkgrel=2
pkgdesc='Stores, retrieves, generates, and synchronizes passwords securely'
arch=('any')
url='http://zx2c4.com/projects/password-store/'
license=('GPL2')
depends=('xclip' 'bash' 'gnupg' 'pwgen' 'tree')
optdepends=('git: for Git support'
            'dmenu: for passmenu')
replaces=('passmenu')
provides=('passmenu')
conflicts=('passmenu')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/zx2c4/password-store/archive/${pkgver}.tar.gz")
md5sums=('cd2a4a905f1c3ecbc3f1c3768701e2cc')

package() {
  cd "${srcdir}/password-store-$pkgver/"
  make DESTDIR="${pkgdir}" FORCE_ALL=1 install

  cd contrib/dmenu
  install -Dm0755 passmenu "${pkgdir}/usr/bin/passmenu"
}
