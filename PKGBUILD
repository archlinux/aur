# Maintainer: archlinuxauruser <archlinuxauruser at messagebox dot email>
# Contributor: aulonsal <seraur at aulonsal dot com>
pkgname=f2-bin
pkgver=2.1.0
pkgrel=1
pkgdesc='Cross-platform command-line tool for batch renaming files and directories quickly and safely'
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ayoisaiah/${pkgname%-bin}"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname}-${pkgver}-LICENCE::${url/github/raw.githubusercontent}/v${pkgver}/LICENCE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_amd64.tar.gz")
source_i686=("${pkgname}-${pkgver}-i686.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_386.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_linux_arm64.tar.gz")

b2sums=('1375f8eb689085b7735551ce0f5f19167df905bdf8f105ac72479ae6214666f74a03ce24766bc08a9407c878ecd8078ca3e81013ecf4fd8c80a52dc308e29d78')
b2sums_x86_64=('75e1d6ed61cb5d110ee307a257cc4a69526476a292e7b64111afe802966878dc84cfdd224743a6ec0c691b54b4e014aa2ec9237320d180e34f176296432bc4cf')
b2sums_i686=('1664edeb7d6f18052d8a01cb882fff8795b4c150858c5f26add04bf75f3ea2449005f6f99bea37fbf5510d8892a80d249f6acff9707528ed8ade23e13a9f2b89')
b2sums_aarch64=('a83cd2888513bbfdcc1a6b494ad74c42c2ab9caf02b87a65d3a6f91baa54cfbea3399d97e8f3c4eabd02fc4ed39fe67c2aed3c4f5e95d6146de6f9c66156c145')

package() {
	install -Dm755 "${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	install -Dm644 "${pkgname}-${pkgver}-LICENCE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENCE"
	install -Dm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname%-bin}"
}
