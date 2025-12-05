# Maintainers: kobe-koto <k at koto dot cc>
pkgname="liteloader-qqnt-patcher"
pkgver=0.0.2
pkgrel=1
pkgdesc="A Patcher for LiteLoaderQQNT"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-patcher")
install=liteloader-qqnt-patcher.install

source=("LiteLoaderQQNT.js"
        "liteloader-qqnt-patcher.sh"
        "liteloader-qqnt-patcher-notify.hook")
sha256sums=('07739e1313a47ba3fa22d30ecf295afe1603cc8401d370fe22aa8dfc8da8c0c7'
            '98a4939a11580d814bfc1cbedfc7797d24747df050e0757a5c81f20d801759cd'
            '27504cff74f4a2d9c332e810ab9d7efe916833a9ce12580f78c9efb8604e2916')

package() {
	install -Dm755 "${srcdir}/LiteLoaderQQNT.js" -t "${pkgdir}/opt/QQ/resources/app/app_launcher/"
    install -Dm755 "${srcdir}/liteloader-qqnt-patcher.sh" -t "${pkgdir}/usr/bin/liteloader-qqnt-patcher.sh"
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-notify.hook" -t "${pkgdir}/usr/share/libalpm/hooks/"
}
