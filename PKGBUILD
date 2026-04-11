# Maintainers: kobe-koto <k at koto dot cc>
# shellcheck disable=SC2034
declare pkgdir
declare srcdir

pkgname="liteloader-qqnt-patcher"
pkgver=0.0.3
pkgrel=2
pkgdesc="A patcher for LiteLoaderQQNT"
arch=('any')
url="https://github.com/LiteLoaderQQNT/LiteLoaderQQNT"
license=('MIT')
depends=("liteloader-qqnt")
provides=("liteloader-qqnt-patcher")
conflicts=("linuxqq-appimage")
install=liteloader-qqnt-patcher.install

source=("LiteLoaderQQNT.js"
        "liteloader-qqnt-patcher.sh"
        "liteloader-qqnt-patcher-notify.hook"
        "liteloader-qqnt-patcher-patch.hook")
sha256sums=('07739e1313a47ba3fa22d30ecf295afe1603cc8401d370fe22aa8dfc8da8c0c7'
            'd3c7a6a22e08ff1ccc550c759dced749b6e0ef8709e7bd9ab290c176f8f29944'
            'b91c982d04843c76bc7d0f04a095dc707c87ecceb7c6cce4e8db61af60c596ed'
            '604f6b8face943aa02c067e1f38cd8eafd1647c2c40c37be147c8d64acec3257')

package() {
    install -Dm755 "${srcdir}/liteloader-qqnt-patcher.sh" -T "${pkgdir}/usr/bin/liteloader-qqnt-patcher"
    
    install -Dm755 "${srcdir}/LiteLoaderQQNT.js" -t "${pkgdir}/opt/QQ/resources/app/app_launcher/"

    # ALPM hooks
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-notify.hook" -t "${pkgdir}/usr/lib/liteloader-qqnt-patcher/libalpm-hooks/"
    install -Dm644 "${srcdir}/liteloader-qqnt-patcher-patch.hook" -t "${pkgdir}/usr/lib/liteloader-qqnt-patcher/libalpm-hooks/"
}
