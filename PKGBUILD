# Maintainer: Markus Pesch <markus.pesch@cryptic.systems>

pkgname=rpm-builder
pkgver=0.4.0
pkgrel=1
pkgdesc='Build rpms without a spec file. Pure Rust. No dependencies to librpm'
arch=('x86_64')
url=https://github.com/Richterrettich/rpm-builder
license=('Apache 2.0')
makedepends=('rust')
source=("https://codeload.github.com/Richterrettich/rpm-builder/tar.gz/${pkgver}")
sha256sums=('SKIP')

build() {
  make -C "${srcdir}/${pkgname}-${pkgver}" build
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/${pkgname}.bash" "${pkgdir}/etc/profile.d/${pkgname}.sh"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}