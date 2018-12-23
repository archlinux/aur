# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# original PKGBUILD by tsujigiri <helge@rausch.io>
_pkgname=vcvrack
pkgname=${_pkgname}-bin
pkgver=0.6.2c
pkgrel=1
pkgdesc='Open-source virtual modular synthesizer'
url='https://vcvrack.com/'
license=('BSD')
arch=(x86_64)
provides=('vcvrack')
conflicts=('vcvrack')
depends=('gtk2' 'alsa-lib' 'libglvnd')
optdepends=('jack')
source=("https://vcvrack.com/downloads/Rack-$pkgver-lin.zip"
        vcvrack)
sha256sums=('822cdacfaf30e43bd861ce3975056b29ca33541d1a539acc0078266d5fbf754d'
            'd98a5e0c8d811aa9edf0040570e5363da712d676b46e82b2c64e8aad4b876417')

package() {
  mkdir -p "$pkgdir/opt/"
  cp -R Rack "$pkgdir/opt/$_pkgname"

  install -D vcvrack "$pkgdir/usr/bin/vcvrack"
}
