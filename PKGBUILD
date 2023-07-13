pkgname="ancientbeast"
_pkgname="AncientBeast"
pkgver=0.4
pkgrel=1
pkgdesc="Turn Based Strategy Game. Master your beasts!"
arch=('x86_64')
url="https://github.com/FreezingMoon/AncientBeast"
makedepends=('npm')
license=('AGPL3')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/FreezingMoon/AncientBeast/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a1889c32a89ab5080d8301738f432b4abd7c60310ea068fc45d77ef159854b6a')


build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	npm install
}

package() {
    mkdir -p "${pkgdir}/opt/${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/"
    mv * "${pkgdir}/opt/${pkgname}/"
}
