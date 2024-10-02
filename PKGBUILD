# Maintainer: Māris Vilks <kaaposc@gmail.com>
pkgname=latvia-eid-middleware
pkgver=2.2.9
pkgrel=1
pkgdesc="Middleware for using Latvia-eid smart cards"
arch=('x86_64')
url="https://www.pmlp.gov.lv"
license=('LGPL')
groups=('eparaksts')
provides=('eidlv-pintool')
depends=('gtk2' 'openssl-1.0' 'libsm' 'pcsclite' 'glu')
optdepends=('nss: modutil tool for installing PKCS#11 module')
makedepends=('binutils' 'tar')
install='middleware.install'
source=("https://www.eparaksts.lv/files/ep3updates/debian/pool/eparaksts/l/${pkgname}/${pkgname}_${pkgver}-4_amd64.deb"
  "pintool.patch")
sha512sums=('9e9dd327991a203b0054d61ee545cbb322af50a7f99e9bb9e4121e866040a33290962ed25efcbf7bf593d6b7dda58840a78c3df6a4f58c1187560595c0aceb74'
  'a3bd51369a014d8ca1ee10ef0613573cc500c6f2eacbf912422075bebedb11e9ed522e42e343cff1a641fc3bec7b947f6aa86fbe94e3e1a39591c6fb0fde368c')

package() {
  ar x "${pkgname}_${pkgver}-4_amd64.deb"

  tar --no-same-owner -xJf data.tar.xz -C "${pkgdir}"

  cd "${pkgdir}"
  patch --forward --strip=1 <"${srcdir}/pintool.patch"

}
