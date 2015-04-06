# Maintainer: Sven Schneider <archlinux.sandmann@googlemail.com>
# Contributor: PyroPeter <com.googlemail@abi1789>

pkgname=otrtool
pkgver=1.1.1
pkgrel=1
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com) [otrdecoder]"
arch=('i686' 'x86_64')
url="http://pyropeter.github.com/otrtool/"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
source=("http://github.com/pyropeter/otrtool/tarball/v${pkgver}")
md5sums=('fbee6c737d95523cad24af322c8621b3')
sha256sums=('5141da20ca2d595fc537853e3acbf426f61eb65ee2783ba0ba2881db00747e0d')
sha384sums=('aede4bf0552403fd54625e6562ec106fa96eba1d1d55c202169591063510e6670d7d4099dafebdca6d0cc467796c9b85')
sha512sums=('cfe346021ecb05289548dc0e13ec489bafb818e0d36d6771ca934e888b24170d47239370686095761b694fa0f009970a432bebea7f1e244ab86d099e0d8af32d')

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

