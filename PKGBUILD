# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=5.3.3
pkgrel=1
pkgdesc="Front-end framework for web development"
arch=('any')
url="https://getbootstrap.com/"
license=('MIT')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
        "LICENSE")
sha512sums=('bf01668028e344610eb8e600b10f4845b223216fa34d82c05c6f32e3ee3ccdc0cd82f10e5e5aaf6e7f046324d9c963519efc6d1948a3e49b98baeecf4770d104'
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
