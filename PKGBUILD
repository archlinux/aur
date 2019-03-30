# Maintainer: dtluna <dtluna at waifu dot club>

_pkgname_base='emoji-stealer'
pkgname="${_pkgname_base}-bin"
_pkgname='emoji_stealer'
pkgver='1.1.0'
pkgrel=1
pkgdesc='Emoji stealer for Mastodon and Pleroma'
url='https://git.dtluna.net/dtluna/emoji_stealer'
arch=('x86_64' 'i686')
license=('custom:WTFPL')

depends=()
makedepends=()
optdepends=()

conflicts=("${_pkgname_base}")

source_x86_64=("${pkgname}_${pkgver}_linux_x86_64.zip::https://git.dtluna.net/attachments/5874b866-e7f7-43f3-8c14-43b57f2cf746")
source_i686=("${pkgname}_${pkgver}_linux_i686.zip::https://git.dtluna.net/attachments/b2dae06e-21f5-4eba-b3fc-fb393167a399")

sha256sums_x86_64=('1753350f37764e7936a00b1b967a2fb46c44cf5d0dac3a86538609a96c92ede4')
sha256sums_i686=('5464a7804f4a06b7238737a28c5f5e13315c936e2ec0fe4a761a85f660987318')


package() {
	  # Bin
	  rm -f "${pkgdir}/usr/bin/${pkgname}"
	  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname_base}"

	  # License
	  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname_base}/LICENSE"
}

