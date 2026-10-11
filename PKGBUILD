# Maintainer: GoodbyeNJN <cc at fuckwall dot cc>
# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>

pkgname='deeplx-bin'
_binname='deeplx'
pkgver=1.3.1
pkgrel=1
pkgdesc='DLX - Self-hosted translation API server. Unofficial; not affiliated with DeepL SE'
arch=('x86_64' 'i686' 'aarch64' 'mips')
url='https://github.com/OwO-Network/DLX'
_reponame='OwO-Network/DLX'
license=('MIT')
provides=("${_binname}")
conflicts=("${_binname}" "${_binname}-git" 'dlx')
install="${pkgname}.install"
source=("https://raw.githubusercontent.com/${_reponame}/refs/tags/v${pkgver}/deeplx.service"
        "https://raw.githubusercontent.com/${_reponame}/refs/tags/v${pkgver}/LICENSE")

source_x86_64=("${_binname}-x86_64-${pkgver}::https://github.com/${_reponame}/releases/download/v${pkgver}/deeplx_linux_amd64")
source_aarch64=("${_binname}-aarch64-${pkgver}::https://github.com/${_reponame}/releases/download/v${pkgver}/deeplx_linux_arm64")
source_i686=("${_binname}-i686-${pkgver}::https://github.com/${_reponame}/releases/download/v${pkgver}/deeplx_linux_386")
source_mips=("${_binname}-mips-${pkgver}::https://github.com/${_reponame}/releases/download/v${pkgver}/deeplx_linux_mips")

sha256sums=('c78a8ea845bc8c2312a378b1d26e9d631a38022921a8ea193017f46015969654'
            '07d8087d9d722927de7a76beea85fae9f23348ce410aea1daf9159bdc7ae76c7')
sha256sums_x86_64=('4afe47d3866e6c6b38f5ffdb702a8b9e1582e75943810e2576558e934b85ebe0')
sha256sums_i686=('6bf26df70832af7ec8e72e077cc683ab35c02c98f6b12855fcf738b918b2aab1')
sha256sums_aarch64=('7a22c6c0b5136f260a98150e15624a4dde5213740ba7732029349ab09bfaf8e9')
sha256sums_mips=('962899536ab208a4045fc6986945eb70b8bf81ccd255e6086138f38620cbf670')


package() {
	install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
