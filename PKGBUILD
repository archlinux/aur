# Maintainer: GoodbyeNJN <cc at fuckwall dot cc>
# Maintainer: Aron Young <tkf6fkt at gmail dot com>
# Contributor: asukaminato <i at asukaminato dot eu dot org>

pkgname='deeplx-bin'
_binname='deeplx'
pkgver=1.1.0
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

sha256sums=('4254690f52328eeb9f4c7a83485947ca024d66d6358b1cc3bf9554c8d870d434'
            '07d8087d9d722927de7a76beea85fae9f23348ce410aea1daf9159bdc7ae76c7')
sha256sums_x86_64=('412aa76f8a5a8eb60b5367a1125d38b507db255cbfb91d95550dde1da66cfb85')
sha256sums_i686=('0e779ceb8767f2bc84aebd4bf17caa8bb7468a29f55dfd18df6d6c1b0c3c1e4b')
sha256sums_aarch64=('e36f9a6866311f5cd592b2b28689ed4fe52ead02618a5274fd37228b4cbf7748')
sha256sums_mips=('8bb10e32f972bc4f58ba5f1100b062e4051c44d5fcadda1b9198eff905848a02')


package() {
	install -Dm755 "${_binname}-${CARCH}-${pkgver}" "${pkgdir}/usr/bin/${_binname}"
	install -Dm644 deeplx.service -t "${pkgdir}/usr/lib/systemd/system/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
