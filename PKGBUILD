# Maintainer: soraxas <oscar@tinyiu.com>

_pkgname=pdf4teachers
pkgname=$_pkgname-bin
pkgver=1.4.0
pkgrel=1
pkgdesc="PDF editing software in large quantities designed for teachers"
arch=('x86_64')
url="https://github.com/ClementGre/$_pkgname"
license=('APACHE')
depends=('java-runtime')
provides=('pdf4teachers')
source=("https://github.com/ClementGre/$_pkgname/releases/download/$pkgver/$_pkgname-Linux-${pkgver}.deb")
sha256sums=('593762d6638b4fe64e82ba7e80210acddc9671062c7d9ed0ea2ddc6674c0b4ce')


package() {
  bsdtar -xf "$srcdir/data.tar.xz" -C "$pkgdir"

  install -Dm 644 "${pkgdir}/opt/pdf4teachers/lib/pdf4teachers-PDF4Teachers.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -Dm 644 "${pkgdir}/opt/pdf4teachers/share/doc/copyright" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -d "${pkgdir}/usr/bin/"
  ln -s /opt/pdf4teachers/bin/PDF4Teachers "${pkgdir}/usr/bin/$_pkgname"
}
