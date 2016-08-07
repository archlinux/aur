# Maintainer: Ricardo Band <email@ricardo.band>

pkgname=hedera-icon-theme-git
pkgver=0.r99.5c8b942
pkgrel=1
pkgdesc='A classic icon theme in the spirit of Tango!.'
arch=('any')
url='https://github.com/sixsixfive/Hedera/'
license=('custom:CC-BY-SA 4.0')
depends=('gtk-update-icon-cache')
makedepends=('git')
provides=('hedera-icon-theme')
conflicts=('hedera-icon-theme')
options=('!strip')
source=('git+https://github.com/sixsixfive/Hedera.git')
sha256sums=('SKIP')

pkgver()
{
  cd Hedera/
  echo "0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package()
{
  cd Hedera/CP_TO_DATADIRS/icons/
  install -dm 755 "$pkgdir"/usr/share/icons
  cp -dr --no-preserve='ownership' Hedera "$pkgdir"/usr/share/icons/
}

# vim: ts=2 sw=2 et:
