# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: PyroPeter <com.googlemail@abi1789>

pkgname=otrtool
pkgver=1.2.0
pkgrel=1
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com) [otrdecoder]"
arch=('i686' 'x86_64')
url="http://pyropeter.github.com/otrtool/"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
source=("http://github.com/pyropeter/otrtool/tarball/v${pkgver}")
sha512sums=('7017068780ebee307573f82a8b01de676d8ed57c43516e5b764c65e9fe07c64e0533fee5d0cdcd16007e3b74d72e1e4c98b6e2c6a3e08b337ed7376909a87552')

build() {
  cd "${srcdir}"/otrtool-otrtool-*

  make
}

package() {
  cd "${srcdir}"/otrtool-otrtool-*

  mkdir -p "${pkgdir}"/usr/{bin,share/{man/man1,licenses/otrtool}}
  install -m775 otrtool "${pkgdir}/usr/bin/"
  install -m644 otrtool.1.gz "${pkgdir}/usr/share/man/man1"
  install -m644 LICENSE "${pkgdir}/usr/share/licenses/otrtool"
}

