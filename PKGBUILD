# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Yannik Stein <yannik.stein [at] gmail.com>
# Contributor: Dan Serban
# Contributor: flying-sheep
# Contributor: Liu Chang <goduck777@gmail.com>

pkgname=pdftk-bin
pkgver=2.02_1
pkgrel=4
pkgdesc="Swiss army knife for PDFs. Built from binary executables available in Debian repositories."
url=http://www.pdfhacks.com/pdftk
arch=(i686 x86_64)
license=(GPL)
depends=(libgcj gcc-libs)
provides=(pdftk)
conflicts=(pdftk pdfchain-all-inclusive)


if [[ $CARCH == i686 ]]; then
  _debarch=i386
  sha512sums=(e0448e23fd6500a78a00a874684110b79a7397bf15629582452466ce368e604737931bfcf9fbdf16f282976f11d096f262b49b64607ac63a70fee0679b5a4314)
else
  _debarch=amd64
  sha512sums=(3f834c4e5a4396fbeda8c32e1e634804ae32bfd4b63d05468a6d48b0b21cd3214e2abdc2ed1ff881306feb0e72abbb9c4c21b89c45d500a50700d90dda074185)
fi

source=(http://ftp.debian.org/debian/pool/main/p/pdftk/pdftk_${pkgver//_/-}_${_debarch}.deb)

package() {
  tar -xf data.tar.?z -C "$pkgdir" ./usr
}

# vim:set ts=2 sw=2 et:
