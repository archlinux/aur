# Maintainer: Bjoern Franke <bjo@nord-west.org>
pkgname=mpdlcd
pkgver=0.4.3
pkgrel=2
pkgdesc="Display MPD status on a lcdproc server"
arch=('any')
url="https://github.com/rbarrois/mpdlcd"
license=('MIT')
makedepends=('python2-pip')
depends=('python2' 'python2-lcdproc' 'mpd')
options=(!emptydirs)
backup=('etc/mpdlcd.conf')
source=(https://pypi.python.org/packages/source/m/mpdlcd/mpdlcd-$pkgver.tar.gz
	'service')

md5sums=('d7c6f61d556b9c1585806468d6e8c4cf'
         '724210e824ec35e6308fc6b6c19c634d')


package() {
  cd "${srcdir}"/mpdlcd-"${pkgver}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
  install -Dm644 "${srcdir}"/mpdlcd-"${pkgver}"/mpdlcd.conf \
    "${pkgdir}"/etc/mpdlcd.conf
  install -Dm644 "${srcdir}"/service \
    "${pkgdir}"/usr/lib/systemd/system/mpdlcd.service

}

# vim:set ts=2 sw=2 et:
