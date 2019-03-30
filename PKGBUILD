# Maintainer: Eduard Toloza <tolosaeduard@gmail.com>

pkgname=upcheck
pkgver=0.1.2
pkgrel=1
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url='https://gitlab.com/edu4rdshl/upcheck'
license=('GPL3')
depends=('pacman-contrib')
source=("https://gitlab.com/edu4rdshl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('eb3f39b4af78465c678d9a987cd0b2140673b4152100324ca82c662a5255d24ed55becae857e134a908435e865282213498cad2786b1fefa9ca45ba2a1eebd78')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 bin/"${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 "${pkgname}".service "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
