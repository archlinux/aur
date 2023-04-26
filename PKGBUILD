# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=terminal-headers
pkgver=1.4
pkgrel=1
pkgdesc='Color scripts providing a fun greeting when opening a terminal or reloading your shell'
install=terminal-headers.install
arch=(x86_64)
url="https://gitlab.com/a4to/${pkgname}"
license=('MIT')
depends=(python-lolcat figlet bc)
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  'b63266fc5a9484fd66fccbcbd4528e5d5ff7326707b3e17bb24efec9b46b5bb0a934d9fcda8a874a61f136e5567a442878dd59f0e308c141d98457c513487918'
  'a291f1eb4cc0fd5d5d41c397efe1d3b00566abde7c33c1abb7395918ef04959e9ad304fb2aaf536931dd9b1b5beec881a498a9b671355882448df6bbe4b56ed6'
  )
md5sums=(
  'd63b5d52878937c49de123b9fe290166'
  '081caa1f04947942f72cff5ba2d67a4b'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 opt/${pkgname}/* -t "${pkgdir}/opt/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/terminal-headers/fonts/future.tlf "${pkgdir}/usr/share/terminal-headers/fonts/future.tlf"
}
