# Maintainers: kobe-koto <k at koto dot cc>
pkgname="liteloader-qqnt-patcher"
pkgver=0.0.1
pkgrel=2
pkgdesc="A Patcher for LiteLoaderQQNT"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-patcher")
install=liteloader-qqnt-patcher.install

source=("LiteLoaderQQNT.js"
        "patcher.sh"
        "liteloader-qqnt-patcher-notify.hook")
sha256sums=('2e35c441765403daca5a80416717550adb8f718a8558580ed682e65248831ee6'
            'f9c76f919cfa72a3579637a5e585699f62d98ae7fabafd2796b97d3355ae842b'
            '589c85d842387cfedad6128f8f9311869c01a74be1c6b32e38011ac1f4015292')

package() {
	install -Dm755 "${srcdir}/LiteLoaderQQNT.js" -t "${pkgdir}/opt/QQ/resources/app/app_launcher/"
    install -dm755 "${pkgdir}/opt/LiteLoaderQQNT/"
    install -Dm755 "${srcdir}/patcher.sh" -t "${pkgdir}/opt/LiteLoaderQQNT/patcher/"
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-notify.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
}
