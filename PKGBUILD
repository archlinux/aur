# Maintainer: Sol Bekic <s+aur at s-ol dot nu>
# original PKGBUILD by tsujigiri <helge@rausch.io>
_pkgname=vcvrack
pkgname=${_pkgname}-bin
pkgver=1.1.3
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
sha256sums=('e0b0feab12534b42007e92941dab220f790af7b598553f34dde1e7109c1bcfed'
            'd98a5e0c8d811aa9edf0040570e5363da712d676b46e82b2c64e8aad4b876417')

package() {
  mkdir -p "$pkgdir/opt/"
  cp -R Rack "$pkgdir/opt/$_pkgname"

  install -D vcvrack "$pkgdir/usr/bin/vcvrack"
}
