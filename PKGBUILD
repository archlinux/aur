# Maintainer: Вячеслав Зубик

pkgname=zvvbook
_pkgname=ZVVBook
pkgbeta=beta
pkgver=5.1_$pkgbeta
pkgrel=2
pkgdesc="fb2, epub & pdf reader"
arch=('i386' 'x86_64')
url="https://zvvubuntu.blogspot.com"
license=('custom')
depends=('python-pyqt5') 

source=("${_pkgname}_${pkgver}.deb::https://docs.google.com/uc?id=1tWZsNm8OaZtbphOySdq0ARdB0NJmEiAH" "$pkgname" "${_pkgname}.desktop")
md5sums=('db903a0084e51cea040a2bb6b45a4bbf'
         'be29d1142c22607c19fefbf42f7aa2e4'
         '4c97905e644c0a2a8cdc1df864659828')

package() {
  cd "${srcdir}"
  bsdtar -xf data.tar.xz -C "$pkgdir"
  install -Dm755 $pkgname $pkgdir/usr/bin/$pkgname
  install -Dm755 ${_pkgname}.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
}
