# Maintainer: dtluna <dtluna at waifu dot club>

_pkgname_base='gorgeous'
pkgname="${_pkgname_base}-bin"
pkgver='1.4.0'
pkgrel=2
pkgdesc='CLI RSS feed reader'
url='https://git.dtluna.net/dtluna/gorgeous'
arch=('x86_64' 'i686')
license=('custom:WTFPL')

depends=()
makedepends=()
optdepends=()

conflicts=("${_pkgname_base}")

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.zip::https://git.dtluna.net/attachments/ff15f6ad-537b-466f-9ccd-487cff0c71d2")
source_i686=("${pkgname}_${pkgver}_linux_i686.zip::https://git.dtluna.net/attachments/390c0796-9632-42e3-8bc2-06ad33d80b1a")

sha256sums_x86_64=('bf346274f5facdfe848fdf43edeebeddde2b92b2460ecd01b022c8f25d0b1ac8')
sha256sums_i686=('c8e820d7009d89491ff3c1d5686b36f3fa80f9c6140f52cadeb53035732ea9a1')


package() {
	  # Bin
	  rm -f "${pkgdir}/usr/bin/${_pkgname_base}"
	  install -Dm755 "${srcdir}/${_pkgname_base}" "${pkgdir}/usr/bin/${_pkgname_base}"

	  # License
	  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname_base}/LICENSE"
}

