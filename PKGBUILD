# Maintainer: haxibami <contact at haxibami dot net>

pkgname=ttf-rubik-vf
pkgver=2.3.0
pkgrel=3
_commit=e337a5f69a9bea30e58d05bd40184d79cc099628
pkgdesc="A sans serif font family with slightly rounded corners: variable font version"
arch=("any")
url="https://github.com/googlefonts/rubik"
license=("OFL")
source=(
  "${url}/raw/${_commit}/fonts/variable/Rubik%5Bwght%5D.ttf"
  "${url}/raw/${_commit}/fonts/variable/Rubik-Italic%5Bwght%5D.ttf"
  "${url}/raw/${_commit}/OFL.txt"
  "${url}/raw/${_commit}/AUTHORS.txt"
  "${url}/raw/${_commit}/CONTRIBUTORS.txt"
)

sha256sums=('1b3a7437ba2af80e465e773ed60c5036d1ba6ace492d89046dbcf18fb31e4e88'
  '08c6c4018a5ada8b517407b46897e46cf6ebb106853fbd3e89addb51d3b59c62'
  '472cbe7c25441df63e9c7864b43eb3c0f4b3df950c66a76224e6cfe1eae843fb'
  '7e2cf473951e887dc83a6676ab3ce19eef293cd0e5b4d15504dcc42228934576'
  'd0955625026fcda3c16cbf518486e7e272ef3a4ca86ef11daafc2892cabb59b6')

package() {
  install -d "${pkgdir}/usr/share/fonts/TTF"
  install -m644 "$srcdir"/*.ttf "${pkgdir}/usr/share/fonts/TTF/"
  cd "$srcdir"
  install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" OFL.txt AUTHORS.txt CONTRIBUTORS.txt
}
