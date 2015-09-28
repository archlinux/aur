# Maintainer: dryes <joswiseman@cock.li>
pkgname='autsmuxer-git'
pkgver=32
pkgrel=1
pkgdesc='autsmuxer is effectively MKV2VOB for *NiX systems.'
url='https://github.com/d2yes/autsmuxer'
arch=('any')
license=('GPL')
depends=('tsmuxer-ng' 'mkvtoolnix' 'mencoder' 'aften' 'libdca')
optdepends=('spdifconvert')
makedepends=('git')
source=('git://github.com/d2yes/autsmuxer.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  install -D -m755 "${srcdir}/autsmuxer/autsmuxer.sh" "${pkgdir}/usr/bin/autsmuxer"
}
