pkgname=scannerl
pkgver=0.42
pkgrel=2
pkgdesc="The modular distributed fingerprinting engine"
arch=('any')
url="https://github.com/kudelskisecurity/scannerl"
license=('GPL')
groups=()
depends=('erlang-nox>=20' 'openssh')
makedepends=('rebar' 'git')
source=("git+https://github.com/kudelskisecurity/scannerl.git#tag=v${pkgver}")
md5sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  ./build.sh
}

package() {
  cd "${pkgname}"

  install -Dm755 scannerl "${pkgdir}/usr/bin/${pkgname}"

  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 AUTHORS "${pkgdir}/usr/share/doc/${pkgname}/AUTHORS"
  install -Dm644 DISCLAIMER.txt "${pkgdir}/usr/share/doc/${pkgname}/DISCLAIMER.txt"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

}
