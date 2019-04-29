# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=mpdlcd
pkgver=0.5.2
pkgrel=2
pkgdesc="Display MPD status on a lcdproc server"
arch=('any')
url="https://github.com/rbarrois/mpdlcd"
license=('MIT')
makedepends=('python-pip')
depends=('python' 'python-lcdproc' 'mpd')
options=(!emptydirs)
backup=('etc/mpdlcd.conf')
source=("https://github.com/rbarrois/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz" "service")
md5sums=('e60415c86d8031df1ad4fb391bd8ee4d'
         '724210e824ec35e6308fc6b6c19c634d')



package() {
  cd "${srcdir}"/mpdlcd-mpdlcd-"${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/mpdlcd-mpdlcd-"${pkgver}"/mpdlcd.conf \
    "${pkgdir}"/etc/mpdlcd.conf
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/mpdlcd.service

}

# vim:set ts=2 sw=2 et:
