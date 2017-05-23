# Maintainer: Tony G. <aur at tonyskapunk dot net>

pkgname='scaleft-url-handler'
pkgdesc='ScaleFT(TM) URL handler'
pkgver=1.25.3
pkgrel=1
arch=('any')
url="https://scaleft.com"
license=('custom')
makedepends=('rpmextract')
depends=('scaleft-client-tools' 'python2')
source=("https://pkg.scaleft.com/rpm/${pkgname}-${pkgver}-${pkgrel}.noarch.rpm")
sha256sums=('b628ba1e5488f6d5c69b0e7cf3cd370f9bad8fce24385922d80791f91f04282e')

prepare() {
	rpmextract.sh ${pkgname}-${pkgver}-${pkgrel}.noarch.rpm
}

package() {
  install -dm0755 ${pkgdir}/usr/lib/python2.7/site-packages/scaleft_url_handler-${pkgver}.egg-info
  install -m0644 usr/local/lib/python2.7/dist-packages/scaleft_url_handler-${pkgver}.egg-info/* \
                 -t ${pkgdir}/usr/lib/python2.7/site-packages/scaleft_url_handler-${pkgver}.egg-info 
  install -Dm0755 usr/bin/scaleft-url-handler ${pkgdir}/usr/bin/scaleft-url-handler
  install -Dm0644 usr/share/applications/scaleft-handler.desktop \
                  ${pkgdir}/usr/share/applications/scaleft-handler.desktop
}
