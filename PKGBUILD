# Maintainer:  Andrew O'Neill <andrew at meanjollies dot com>
# Contributor: Eisfreak7 <eisfreak7@gmail.com>

pkgname=xtitle
pkgver=0.4.4
pkgrel=2
pkgdesc='Outputs X window titles'
arch=('x86_64')
url="https://github.com/baskerville/${pkgname}"
license=('custom:Unlicense')
depends=('libxcb' 'xcb-util-wm' 'xcb-util')
conflicts=("${pkgname}-git")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('c2fbf403892c4e466e43528415284a458d4354855f221273881aa4388d028970')

build() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr
}

package() {
  cd "${pkgname}-${pkgver}"

  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
