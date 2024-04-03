# Maintainer: soraxas <oscar@tinyiu.com>

_pkgname=pdf4teachers
pkgname=$_pkgname-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="PDF editing software in large quantities designed for teachers"
arch=('x86_64')
url="https://github.com/ClementGre/$_pkgname"
license=('APACHE')
depends=('java-runtime')
provides=('pdf4teachers')
source=("https://github.com/ClementGre/$_pkgname/releases/download/$pkgver/$_pkgname-Linux-${pkgver}.deb")
sha256sums=('a3841ec94d0b547c3f9486d8ebf61a27be28ca220c4c506b0fa4ebb4cc3ce29b')


package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -Dm 644 "${pkgdir}/opt/pdf4teachers/lib/pdf4teachers-PDF4Teachers.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm 644 "${pkgdir}/opt/pdf4teachers/share/doc/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/pdf4teachers/bin/PDF4Teachers "${pkgdir}/usr/bin/$_pkgname"
}
