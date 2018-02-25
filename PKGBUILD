# Maintainer: cyrant <cyrant at tuta dot io>

pkgname=scenarist-bin
pkgver=0.7.2.beta5
pkgrel=1
pkgdesc='Screenwriting software, which developed in Russia.'
url='https://kitscenarist.ru'
arch=('x86_64')
license=('GPL3')
conflicts=('scenarist')
depends=('dbus' 'glib2')
source=("https://kitscenarist.ru/downloads/linux/scenarist-setup-${pkgver}_en_amd64.deb")
sha512sums=('a0bfc0072dcba4b961989cfa0861b7e233b71ea2662ecfe6f41fa06abb85d8bd19d496a23d751ed946d3c5d7aae18f4ab4ac5c67c43b27e67d56ac0c225415ef')
options=('!strip' '!emptydirs')

package() {
  tar xf data.tar.xz -C "${pkgdir}"
  find "${pkgdir}" -not -path "${pkgdir}/usr/share/KIT*" -exec chmod g-w '{}' +
}
