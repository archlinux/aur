# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Ghost of Kendo <ghostofkendo at gmail dot com>

pkgname=ispin
pkgver=6.5.0
pkgrel=1
pkgdesc='New Tcl/Tk GUI for Spin replacing xSpin'
arch=('any')
url='http://spinroot.com/'
license=('custom:SPIN')
depends=('spin>=6.0' 'tk>=8.5' 'gcc')
optdepends=('graphviz: recommended, provides dot tool for automata view'
            'curl: for version check information')
source=("https://github.com/nimble-code/Spin/archive/version-${pkgver}.tar.gz"
	      LICENSE)
sha512sums=('0beeb1faea93f806c37a4b76c2c407363990596134fc60b15c3f3a2d33ccf59680acd30e251c4f83fb725903aecb6238b166af7dbc9296a8a34259feabeeae24'
            '9b2af61f49ea5faa646053e42640cea4d4a351e035f0f9b648901821d28950f73228abe83cae2d94bddf9bd497845713b835c0e48e5c54f50bb806e3055bf61b')

build() {
  cd Spin-version-${pkgver}/Src
  make
}

package() {
  install -Dm755 Spin-version-${pkgver}/optional_gui/${pkgname}.tcl "${pkgdir}"/usr/bin/${pkgname}
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
