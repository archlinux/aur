# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=5.3.1
pkgrel=1
pkgdesc="Front-end framework for web development"
arch=('any')
url="https://getbootstrap.com/"
license=('MIT')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
        "LICENSE")
sha512sums=('536285e37e06682d819657561357d0ebbb09ceb371ed7787e25824bfb20a396f6a258b47f5d91f59d11bbc539cc0f8706fb8cbdf5bafe36feae2f0deec964468'
            '91e5270a12dbe91894bbbc0024314255ad3a0bb6cc85474d2887068026a0e914199822cfa54d144d531d129b26163bc8cea311c73fad3b83cb914a0971a27a1e')

package() {
  cd ${pkgname}-${pkgver}-dist
  install -d ${pkgdir}/usr/share/javascript/${pkgname}/{css,js}
  for _jsfile in ./js/*; do
	install -m0644 "${_jsfile}" "${pkgdir}/usr/share/javascript/${pkgname}/js/"
  done
  for _cssfile in ./css/*; do
	install -m0644 "${_cssfile}" "${pkgdir}/usr/share/javascript/${pkgname}/css/"
  done
  install -Dm0644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" 
}
