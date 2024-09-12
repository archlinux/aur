# Maintainer: solnce <echo c29sbmNlQHJhdGFqY3phay5vbmU= | base64 -d>
# Co-Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgname=viddy
pkgname=${_pkgname}-bin
pkgver=1.1.2
pkgrel=4
pkgdesc='A modern watch command, binary version'
url="https://github.com/sachaos/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/sachaos/${_pkgname}/v${pkgver}"
arch=('x86_64' 'i686' 'aarch64')
license=('MIT')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-x86_64.tar.gz")
source_i686=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-i686.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-v${pkgver}-linux-arm64.tar.gz")
sha256sums=('e6eea22d4e9e0aa6a78d0f9126009ec041ea047f94b320c003c34a631821f953'
            '17341d78f1cd1a5bcd9df47f81f6f6eabd44a3a3226376261d2395c2880eebcd')
sha256sums_x86_64=('4c8d0d255ed598109bc0a51e13eaa0c2dcbd6167b9ad9cec8282c075324ee82d')
sha256sums_i686=('7fab30d67057715a08348e1e5b559b5b83c6dab25390fbdc7c0759bf329cf9d3')
sha256sums_aarch64=('db06823fdadd78df6c3219524cbdff5f7844d0d1752e7f0d7c1c87f16e1e40de')

package() {
  cd "$srcdir/"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
