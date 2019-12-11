# Maintainer: Muflone http://www.muflone.com/contacts/english/
# Contributor: Simone Sclavi 'Ito' <darkhado@gmail.com>
# Contributor: Changaco <changaco@changaco.net>

pkgname=mbrola
epoch=1
pkgver=3.01h
pkgrel=1
pkgdesc="A phoneme-to-audio converter used by many TTS (Text-to-speech) programs"
arch=('x86_64')
url="https://github.com/numediart/MBROLA"
license=('custom:Mbrola')
depends=('lib32-glibc')
source=("http://url.muflone.com/${pkgname}-${pkgver}.zip")
sha256sums=('df402fad97c823206fce68837c1d716b9c0466a4cfb554dfb244df7da5589d6e')

prepare() {
  # Prepare license file
  sed -n '/This program and object/,/2.0 A brief description of MBROLA/p' readme.txt | head -n -1 > "LICENSE"
}

package() {
  # Install executable file
  install -m 755 -d "${pkgdir}/usr/bin"
  install -m 755 "mbrola-linux-i386" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "LICENSE"
  # Install documentation file
  install -m 755 -d "${pkgdir}/usr/share/doc/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "readme.txt"
}

