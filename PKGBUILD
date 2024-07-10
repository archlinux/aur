# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="sui"
pkgname="${_pkgname}-bin"
pkgver=1.28.3
pkgrel=1
pkgdesc="A next-generation smart contract platform with high throughput, low latency, and an asset-oriented programming model"
arch=('x86_64')
url="https://${_pkgname}.io"
_url="https://github.com/MystenLabs/${_pkgname}"
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'rust' 'openssl' 'libldap' 'krb5' 'e2fsprogs' 'keyutils' 'libsasl' 'postgresql-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_url}/raw/testnet-v${pkgver}/"{README.md,LICENSE})
source_x86_64=("${_url}/releases/download/testnet-v${pkgver}/${_pkgname}-testnet-v${pkgver}-ubuntu-x86_64.tgz")
sha256sums=('3ededb5b006bf86ea26c03f2073944998e2c8854f1ae150c35c8a418a16c9622'
            'c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4')
sha256sums_x86_64=('0be4af81811fd087a18422610bf901b92d7029da8a289f70932e4afad53dabb5')

package() {
  cd "${srcdir}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  install -d "${pkgdir}/usr/bin/"
  find . -maxdepth 1 -type f -executable -exec install -Dm755 "{}" "${pkgdir}/usr/bin/" \;
}
