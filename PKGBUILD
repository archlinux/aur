# Maintainer: dtluna <dtluna at waifu dot club>

_pkgname_base='htmltui'
pkgname="${_pkgname_base}-bin"
pkgver='1.4.0'
pkgrel=1
pkgdesc='A terminal UI utility to view HTML'
url='https://git.dtluna.net/dtluna/htmltui'
arch=('x86_64' 'i686')
license=('custom:WTFPL')

depends=()
makedepends=()
optdepends=()

conflicts=("${_pkgname_base}")

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.zip::https://git.dtluna.net/attachments/d63a2ab5-af4d-4177-a9c5-c3c371740c78")
source_i686=("${pkgname}_${pkgver}_linux_i686.zip::https://git.dtluna.net/attachments/735470e9-62d3-4c0a-91b8-843d87440d7d")

sha256sums_x86_64=('e30cd6dc57eb480834674c17b4e228bbe5dc20525720d18efc5615bbb9f4552a')
sha256sums_i686=('f22283fac36c7b42c3311ec758f6194f1f29dbe6520e6948b3902fc3a1cddf8e')


package() {
	  # Bin
	  rm -f "${pkgdir}/usr/bin/${_pkgname_base}"
	  install -Dm755 "${srcdir}/${_pkgname_base}" "${pkgdir}/usr/bin/${_pkgname_base}"

	  # License
	  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname_base}/LICENSE"
}

