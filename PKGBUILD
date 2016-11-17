# Maintainer: Teddy Schmitz <teddy@schmitz.hk>
pkgname=neuropol-ttf
pkgver=1.0
pkgrel=1
url="http://www.dafont.com/neuropol.font"
license=('custom')
pkgdesc='Neuropol custom font'
provides=('ttf-font')
arch=('any')
source=("neuropol.zip::http://dl.dafont.com/dl/?f=neuropol")
install=$pkgname.install
md5sums=('d4be833b0d1f63af687878951982bd6c')

prepare() {
  mv "neuropol.ttf" "Neuropol.ttf"
}

package() {
  install -dm755 "${pkgdir}"/usr/share/fonts/TTF 
  install -dm755 "${pkgdir}"/usr/share/licenses/${pkgname}/
  install -Dm644 "${srcdir}"/Neuropol.ttf "${pkgdir}"/usr/share/fonts/TTF/
  install -Dm644 typodermic-eula-02-2014.pdf "${pkgdir}"/usr/share/licenses/${pkgname}/
}
