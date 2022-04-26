# Maintainer: dreieck

_pkgname='netcfg-wireguard'
pkgname="${_pkgname}"
epoch=0
pkgver=0.1
pkgrel=1
pkgdesc="Wireguard extension for 'netcfg'."
url='https://github.com/GNU-Pony/netcfg/'
arch=('any')
license=('BSD')
backup=()
depends=(
  'netcfg'
  'wireguard-tools'
)
makedepends=()
optdepends=()
provides=()
conflicts=()

source=(
  'wireguard-connection'
  'wireguard-example'
  'LICENSE'
)

sha256sums=(
  '6dd5cb8686e2fc7998126532cea74bbfd44df9db852b4f2fdc4fa35b3cb2d1b3'
  '991d070678bf7830b4f53407918fcddbc2ae03e7587e13208db1d147b73488b4'
  '9d1224e61e5d165335cb007013f1072a48c19bbca88a713f36e3e4814bdbba74'
)

package() {
  cd "${srcdir}"

  install -v -D -m755 "${srcdir}/wireguard-connection" "${pkgdir}/usr/lib/network/connections/wireguard"
  install -v -D -m644 "${srcdir}/wireguard-example" "${pkgdir}/etc/network.d/examples/wireguard"

  install -v -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}