# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v2.0.1
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://github.com/xenolf/lego'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=()
makedepends=()

_source="${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_linux"

source_x86_64=("${_source}_amd64.tar.gz")
sha256sums_x86_64=('49014850c2aa8e96dc2d60a19b0e6152c09183737033c194f6c2cd88f0f00459')

source_i686=("${_source}_386.tar.gz")
sha256sums_i686=('8d76247f0214deca401bfc084377ae5ec8e2a2eef1e53714bf67de796493555e')

source_armv7h=("${_source}_armv7.tar.gz")
sha256sums_armv7h=('a08fbad0953dba8182dd79dd4c9497c5b87f901721c425ae4893b3a2549c2033')

source_aarch64=("${_source}_arm64.tar.gz")
sha256sums_aarch64=('29cfac5e7f36b41870a349ad1f85a0871bf67ac499410528778dbe77b57270b1')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
