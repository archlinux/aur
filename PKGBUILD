# Maintainer: Eduard Toloza <tolosaeduard@gmail.com>

pkgname=upcheck
pkgver=0.1.3
pkgrel=1
pkgdesc='Checker for ArchLinux available updates and send it via notify-rust.'
arch=('x86_64')
url='https://gitlab.com/edu4rdshl/upcheck'
license=('GPL3')
depends=('pacman-contrib')
source=("https://gitlab.com/edu4rdshl/${pkgname}/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('38e14ef4910c9afb2858d70a1663dd5fed8f13256240a6d6761e881d943f6dd95bbb46830f568bb60fe2dba822ec3a82741fa058475acc9534746ec0cf149957')

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm 755 bin/"${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 755 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm 644 "${pkgname}".service "${pkgdir}/usr/lib/systemd/user/${pkgname}.service"
}
