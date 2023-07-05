# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: yaa110 <yaa110@gmail.com>
pkgname=nomino-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Batch rename utility for developers'
arch=('x86_64')
url="https://github.com/yaa110/nomino"
license=('Apache' 'MIT')
depends=('gcc-libs' 'glibc')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${pkgname%-bin}-${pkgver}::https://github.com/yaa110/nomino/releases/download/1.3.1/nomino-linux-64bit"
	"LICENSE-MIT::https://raw.githubusercontent.com/yaa110/nomino/master/LICENSE-MIT"
	"LICENSE-APACHE::https://raw.githubusercontent.com/yaa110/nomino/master/LICENSE-APACHE")
sha256sums=('7bceb645e53acb5dff82b4e1cec9e5d568336326b8c89e4870fdbe62dc80547d'
            'c61849f2f67590dc6e6a865e273accfd56a337ae29bc30c93ecaf50bc7bab77f'
            '0beb66d48e2a5702f0f1d8c8f62cce5877410c85eed400952db3d58a759935ef')
package() {
	install -Dm0755 "${srcdir}/${pkgname%-bin}-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}/${pkgname%-bin}"
	install -Dm0755 -d "${pkgdir}/usr/bin"
	ln -s "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}