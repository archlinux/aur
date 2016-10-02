# Maintainer: dryes <joswiseman@cock.li>
pkgname='nzbinfo-git'
pkgver=1
pkgrel=1
pkgdesc='prints some info on input nzbs - just like mediainfo.'
url='https://github.com/dryes/nzbinfo'
arch=('any')
license=('MIT')
depends=('python2' 'python2-pynzb')
makedepends=('git')
source=('git://github.com/dryes/nzbinfo.git')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  echo $(git rev-list --count master)
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  install -D -m755 "${srcdir}/nzbinfo/nzbinfo.py" "${pkgdir}/usr/bin/nzbinfo"
}
