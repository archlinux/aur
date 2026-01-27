# Maintainer: Erik Sonnleitner <es at delta-xi dot net>
# Thanks to  Aliaksei Zhordachkin <aliaksei.here@gmail.com> for the patch allowing direct version access

pkgname=morgen-bin
pkgver=4.0.1
pkgrel=1
pkgdesc='Morgen is a modern, intuitive and smart calendar application.'
arch=('x86_64')
url='https://morgen.so'
license=('custom')
changelog='ChangeLog'
depends=('libsecret' 'libxss' 'dbus' 'hicolor-icon-theme' 'desktop-file-utils')
provides=('morgen')
conflicts=('morgen3-bin')

source=("${pkgname}_${pkgver}-${pkgrel}.xz::https://dl.todesktop.com/210203cqcj00tw1/versions/${pkgver}/linux/deb/x64" morgen)
b2sums=('c228cef9c86abc30395a43a41d223c521d6d082374459e17066dbaab799cedfbd00adf46898c6cd02b2c4cba8be02cb45627ae8d9064886d1a7b3916dfe5907e'
  'ad953f1507c74e71ef2580e8b7c94fe4ea3a77e547f3c459adc7966df84e911fdc35fcf8ca708a28fd42c46999cf395f264333d441da5b4fc7d5644b3779ccdd')

package() {
  tar -xJC "${pkgdir}" -f data.tar.xz
  install -Dm 755 "${startdir}"/morgen "${pkgdir}"/usr/bin/morgen
}
