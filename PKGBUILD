# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Mohammadreza Abdollahzadeh <morealaz [at] gmail [dot] com>

pkgname=bootstrap
pkgver=5.3.8
pkgrel=1
pkgdesc="Front-end framework for web development"
arch=('any')
url="https://getbootstrap.com/"
license=('MIT')
install=bootstrap.install
source=("https://github.com/twbs/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}-dist.zip"
        "LICENSE")
sha512sums=('601f9f9d25a1f894f55cfeac99b0d120af21c50df5154c6c1c751ed00ead3130779b37f5e1155087f5278d887e4d15c8acfd28a17053545a19ecd1c17266becf'
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
