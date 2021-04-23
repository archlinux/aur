# Maintainer: Mikael Blomstrand <gmail: chawlindel>

pkgname=azclient
provides=('azirevpn')
# azirevpn-git package doesn't provide azclient nor azirevpn
conflicts=('azirevpn' 'azirevpn-git')
pkgver=0.5
pkgrel=1
pkgdesc="AzireVPN: Customizable VPN client, meant to be simple and sleek."
arch=('x86_64' 'i686')
url="https://www.azirevpn.com/client"
license=('GPL')
depends=('openvpn' 'qt5-tools' 'qt5-svg' 'polkit-qt5')
source=("https://github.com/azirevpn/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=('fd88bead84ce0f08c0b01eb5bdade653713e88fa')
sha256sums=('fa00081190b52bdee982cc690eae34213af5bfefb66b068232db6cb374bf3225')
sha512sums=('e6d61d1f19616be53fa972c56a9388d80e29997a045bdf5a6e12fac818cafc4de75dd5fe0a6746b9fe80709ba06b4aa32000c675e9e68e27d59a9a8e532c3632')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PREFIX="/usr" qmake
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
