# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Sung Mingi <FiestaLake@protonmail.com>
# Contributor: mars <gzhqyz at gmail dot com>
# Contributor: Ryan Owens <RyanOwens at linux dot com>

pkgname=gnome-shell-extension-hibernate-status
_uuid='hibernate-status@dromi'
pkgver=1.15
pkgrel=1
pkgdesc="Gnome Shell extension that adds a hibernate/hybrid suspend button in Status menu."
arch=('any')
url="https://github.com/arelange/gnome-shell-extension-hibernate-status"
license=('GPL')
depends=('gnome-shell')
makedepends=('git')
provides=('gnome-shell-extension-hibernate-status')
conflicts=('gnome-shell-extension-hibernate-status-git')
_commit=d11284d8e8ef38aaf178963fb950b8ee347451a7
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d057c23fc150542bedd0afc5eb48c1d596067f20dd22c1075cbf4e2e6d177864')
b2sums=('ecbb7c7b3e3416b8d126dbec46751460d5c585641c20abc4a4d603767748b0c7c71f36dac66f0d280cf41c3274b0b7f78dfaa45e7f5827257ecb5186fe86d774')

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
